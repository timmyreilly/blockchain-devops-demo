var PostMsg = artifacts.require("myPostBox");

module.exports = async function(deployer) {
    await deployer.deploy(PostMsg, "PostMsg", "A registry for basic items :-)");
    const registry = await PostMsg.deployed();
    await registry.OpenRegistry();
  };
  