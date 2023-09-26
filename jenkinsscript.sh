#!/bin/bash
. ~/.bashrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec bash
pyenv versions

pyenv global 3.10.0
python3 -m venv myenv
source myenv/bin/activate
echo '#### Checking python ####'
which python3
python3 -V

echo '#### Installing requirements ####'
pip install -r ./requirements.txt

echo '#### Run tests ####'
cd APITests
pytest -m "not short" --alluredir "target/allure_results"

echo '### deactivate virtual environment ###'
deactivate
echo '### change pyenv to system ###'
pyenv global system
