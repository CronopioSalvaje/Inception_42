import { Pot, Potentiometer } from "./potentiometer.js";


customElements.define("pot-element", Pot);


let pot = new Potentiometer("potwrapper", "pot", "sc", '#ff00ee')
let pot2 = new Potentiometer("potwrapper2", "pot2", "sc2", '#ff00ee')
let pot3 = new Potentiometer("potwrapper3", "pot3", "sc3", '#ff00ee')
let pot4 = new Potentiometer("potwrapper4", "pot4", "sc4", '#ff00ee')

