
find_package(Python3 REQUIRED COMPONENTS Interpreter Development)

set(VENV_BIN "./venv/bin")
add_custom_command(
    OUTPUT
        ${VENV_BIN}/python
        ${VENV_BIN}/pip
    COMMAND ${Python3_EXECUTABLE} -m venv venv
    COMMENT "Creating venv"
)

#add_custom_command(
#    OUTPUT pylibpath.txt
#    COMMAND ${VENV_PYTHON} -c "import sysconfig; print(sysconfig.get_path('purelib'))" >pylibpath.txt
#)
add_custom_command(
    OUTPUT ${VENV_BIN}/pip-compile
    DEPENDS ${VENV_BIN}/pip
    COMMAND ${VENV_BIN}/pip install pip-tools
)
add_custom_command(
    OUTPUT requirements.txt
    DEPENDS
        ${VENV_BIN}/pip-compile
        ${CMAKE_CURRENT_SOURCE_DIR}/pyproject.toml
    COMMAND
        ${VENV_BIN}/pip-compile
        --quiet
        -o requirements.txt
        --extra=test
        ${CMAKE_CURRENT_SOURCE_DIR}/pyproject.toml
)
add_custom_command(
    OUTPUT ${VENV_BIN}/pytest
    DEPENDS ${VENV_BIN}/pip requirements.txt
    COMMAND ${VENV_BIN}/pip install -r requirements.txt
)

add_custom_target(
    examples ALL
    DEPENDS ${VENV_BIN}/pytest
    COMMAND ${VENV_BIN}/pytest ${CMAKE_CURRENT_SOURCE_DIR}
)
