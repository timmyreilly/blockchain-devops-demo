var BasicItemRegistry = artifacts.require("BasicItemRegistry");
var PostMsg = artifacts.require("myPostBox"); 

module.exports = async function(deployer) {
  await deployer.deploy(BasicItemRegistry, "BasicItemRegistry", "A registry for basic items :-)");
  await deployer.deploy(PostMsg); 

  const registry = await BasicItemRegistry.deployed();
  await registry.OpenRegistry();
};
