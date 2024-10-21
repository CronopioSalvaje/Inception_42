export class Pot extends HTMLElement {

    //     <div id="potwrapper2" class="potwrapper"> 
    //     <div id="pot2" class="pot">
    //         <div class="marker"></div>
    //     </div>
    //     <svg>
    //         <circle cx="20" cy="20" r="20" id="fc2"></circle>                    
    //         <circle cx="20" cy="20" r="20" id="sc2"></circle>    
    //     </svg>
    // </div>

    static elements = 6;

    constructor() {
        super();
        this.classList.add("potwrapper");
        let pot = document.createElement("div");
        pot.classList.add("pot");
        let marker = document.createElement("div");
        marker.classList.add("marker");
        pot.appendChild(marker);
        this.appendChild(pot);
        let svg = document.createElementNS("http://www.w3.org/2000/svg",'svg');
        let circle1 = this.create_circle()
        let circle2 = this.create_circle()
        svg.appendChild(circle1)
        svg.appendChild(circle2)
        this.appendChild(svg);


        if (Pot.elements === 1) {
            this.id = "potwrapper";
            pot.id = "pot"
            circle2.id = "cursor_circle"

        }
        else {
            this.id = `potwrapper${Pot.elements}`;
            pot.id = `pot${Pot.elements}`;
            circle2.id = `cursor_circle${Pot.elements}`;
        }

        this.potentiometer = new Potentiometer(this.id, pot.id, circle2.id)
        Pot.elements++;
    }

    create_circle() {
        let circle = document.createElementNS("http://www.w3.org/2000/svg",'circle');
        circle.setAttribute("cx", 20)
        circle.setAttribute("cy", 20)
        circle.setAttribute("r", 20)

        return circle
    }


}


function Potentiometer(wrapper, button, vue, ringcolor = "#048cfc") {


    this.wrapper = document.getElementById(wrapper);
    this.potentiomener = document.getElementById(button);
    this.vue = document.getElementById(vue);
    this.potentiomener.addEventListener('mousedown', potEvent, false);
    this.value = 0.1;
    let that = this;
    this.vue.style.stroke = ringcolor;
    this.vue.style.filter = `drop-shadow(0px 0px 5px ${ringcolor})`



    function potEvent(e) {

        let dde = document.documentElement;
        e.preventDefault();
        potAction(e);
        dde.addEventListener("mouseleave", potRemoveEvent, false);
        dde.addEventListener("mousemove", potAction, false);
        dde.addEventListener("mouseup", potRemoveEvent, false);
    }

    function potRemoveEvent(e) {

        let dde = document.documentElement;
        dde.removeEventListener("mousemove", potAction, false);
        dde.removeEventListener("mouseup", potRemoveEvent, false);
        dde.removeEventListener("mouseleave", potRemoveEvent, false)
    }


    function potAction(e) {

        let wrapper = that.wrapper;

        let pot = that.potentiomener;
        let dde = (navigator.vendor) ? document.body : document.documentElement;

        //recherche de la position reel du conteneur du bouton dans la page (prise en compte de la position de chaque conteneur )

        let left = 0;
        let top = 0;
        let element = wrapper;

        while (element) {
            left += element.offsetLeft;
            top += element.offsetTop;
            element = element.offsetParent;
        }

        //offsetWidth = 32
        //distance de la souris par rapport au centre du bouton pour les axes X et Y
        //la distance entre la souris et le centre du bouton donne le rayon d'un cercle

        let X = ((left + (wrapper.offsetWidth / 2)) - (e.clientX + wrapper.scrollLeft));
        let Y = ((top + (wrapper.offsetHeight / 2)) - (e.clientY + wrapper.scrollTop));

        // if (X < (wrapper.offsetWidth / 2) - 3 &&
        //     Y < (wrapper.offsetHeight / 2) - 3 &&
        //     X > -(wrapper.offsetWidth / 2) + 3 &&
        //     Y > -(wrapper.offsetHeight / 2) + 3) {



        //on calcule la tangente du triangle rectangle de coté X et Y on fait inverse tangente (Math.atan)
        // afin d'obtenir l'arctangente exprimé en radian que l'on converti afin d'obtenir l'angle en degre
        //je rajoute 90 degre afin de demarrer la rotation a partir du haut cette valeur est modifiable selon besoin

        let alpha = Math.round((Math.atan(Y / X)) * (360 / Math.PI)) - 75;

        let alpha2 = alpha


        // le potard bouge en mal en fonction du point d'entrée de la souris
        // il faudrait créer un algorithme pour que les valeur d'entrée de x et y 
        // de la souris ne bouleverse pas totalement la position du potard

        //le calcul se faisant sur un demis cercle quand X est supperieur a 0 partie gauche on rajoute 180 degre afin de parcourir le second demi cercle

        if (X >= 0) {
            alpha = alpha + 360;
        }

        //conversion de l'angle afin d'obtenir une valeur alant de 0 a 1 qui peut etre utile quand on associe le bouton a une autre valeur (produit en croix)

        alpha2 = ((1 / 360) * alpha).toFixed(2);

        // document.getElementById('inp1').value = 'X:' + X + '   Y:' + Y;
        // document.getElementById('inp2').value = alpha + '°';
        // document.getElementById('inp3').value = alpha2;

        let root = that.vue




        let numb = 122 - (122 * alpha) / 360;

        if (alpha < 0)
            alpha = 0
        if (alpha > 360)
            alpha = 360;
        if (numb > 122)
            numb = 122;
        if (numb < 0)
            numb = 0

        let effet = 'translate(-50%,-50%) rotate(' + alpha + 'deg)';

        root.style.strokeDashoffset = numb

        pot.style.WebkitTransform = effet;
        pot.style.OTransform = effet;
        pot.style.MozTransform = effet;
        pot.style.msTransform = effet;
        pot.style.transform = effet;
        that.value = 1 - numb / 122;






        // }


    }





} export { Potentiometer }

