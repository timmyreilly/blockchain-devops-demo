const Demo2 = artifacts.require("Demo2");


require("./helpers/workbenchEventValidators.js")(assert); 

contract("Demo2", function(accounts) {

    describe("constructor", function() {
        let demo; 
        before("deploy fresh contract", async function() {
            demo = await Demo2.new();
        });

        it("should have a default value of i", async function() {
            const i = await Demo2.i(); 
            assert.strictEqual(i, 100); 
        }) 
    })
})