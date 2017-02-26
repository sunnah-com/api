HOST=127.0.0.1
PROJECT=hadith_api
CURRENT_DIR=$(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -type d -exec rm -rf {} +

clean-build: clean-pyc
	rm -rf *.egg-info

clean-test:
	pip uninstall -r requirements.test.txt

clean-full: clean-pyc clean-build
	pip uninstall -r test/requirements.txt -y
	pip uninstall -r $(PROJECT)/requirements.txt -y
	rm -rf .env

develop:
	virtualenv --no-site-packages --distribute .env && \
	source .env/bin/activate && \
	pip install -r $(PROJECT)/requirements.txt && \
	pip install -r test/requirements.txt

isort:
	sh -c "isort --skip-glob=.tox --recursive . "

lint:
	flake8 $(PROJECT)

test: clean-pyc lint 
	python -m py.test --verbose --color=yes test/unit --cov=$(PROJECT)

run:
	export PYTHONPATH=$(PYTHONPATH):$(CURRENT_DIR) && \
	pushd $(PROJECT) && \
	chalice local || \
	popd

deploy:
	pushd $(PROJECT)
	chalice deploy
	popd
