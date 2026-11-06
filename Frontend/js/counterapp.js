// es 6
import decValues from './deccount'
import addCount from './addcount'


// es 5
const addValue = require('./addcount');
const decCount = require("./deccount");


function overall() {
    let mycount = document.getElementById("count");
    let Count = 0;

    function updateCOunt() {
        mycount.textContent = Count;
    }
}

export default overall;
