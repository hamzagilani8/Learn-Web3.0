# Reusing common test setups with fixtures

The two tests that we wrote begin with their setup, which in this case means deploying the token contract. In more complex projects, this setup could involve multiple deployments and other transactions. Doing that in every test means a lot of code duplication. Plus, executing many transactions at the beginning of each test can make the test suite much slower.

You can avoid code duplication and improve the performance of your test suite by using fixtures. A fixture is a setup function that is run only the first time it's invoked. On subsequent invocations, instead of re-running it, Hardhat will reset the state of the network to what it was at the point after the fixture was initially executed.

In the code we wrote a deployTokenFixture function that does the necessary setup and returns every value we use later in the tests. Then in each test, we use loadFixture to run the fixture and get those values. loadFixture will run the setup the first time, and quickly return to that state in the other tests.