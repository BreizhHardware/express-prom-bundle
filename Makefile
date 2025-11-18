.PHONY: coverage

test:
	npm test
lint:
	npx eslint src
	npm run dtslint-next
coverage:
	npx nyc --include src --reporter=lcov --reporter=text node_modules/jasme/run.js

coveralls: coverage
	npx nyc report --reporter=text-lcov | npx coveralls
