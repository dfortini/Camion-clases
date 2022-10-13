object knightRider {

	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() {return 1}
	method cargar() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() {return 2}
	method cargar() {transformadoEnAuto = false}
}

class PaqueteDeLadrillos {
	var property ladrillos = 0
	method nivelPeligrosidad() { return 2 }
	method peso() {return ladrillos * 2}
	method bulto() {return 
		if (ladrillos < 101) {1} 
		else if(ladrillos < 300) {2} 
		else if (ladrillos > 300) {3} 
		else {"numero invalido de ladrillos"}
	}
	method cargar() {ladrillos += 12}
}

class ArenaAGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1 }	
	method bulto() {return 1}
	method cargar() {peso += 20}
}

class BateriaAntiaerea{
	var tieneMisiles = false
	method peso() { return if (tieneMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (tieneMisiles) { 100 } else { 0 } }
	method bulto() {return if(tieneMisiles){2}else{1}}
	method cargar() {tieneMisiles = true}
}

class ContenedorPortuario{
	const cosasAdentro = #{}
	const pesoBase = 100
	
	method cargarContenedor(cosa){
		cosasAdentro.add(cosa)
	}
	
	method peso(){
		return pesoBase + cosasAdentro.sum( {c => c.peso() })
	}
	
	method nivelPeligrosidad(){
		return if (cosasAdentro.size() === 0) { 0 } else { self.cosaMasPeligrosa() } 
	}
	
	method cosaMasPeligrosa() {
		return cosasAdentro.max({c => c.nivelPeligrosidad()})
	}
	
	method bulto() {return 1 + cosasAdentro.size()}
	
	method cargar() { cosasAdentro.forEach{c => c.cargar()} }
}

class ResiduosRadioactivos{
	var property peso = 0
	method nivelPeligrosidad(){return 200}
	method bulto() {return 1}
	method cargar() {peso += 15}
}
class EmbalajeDeSeguridad{
	var property cosaQueEmbala = null
	
	method peso(){return cosaQueEmbala.peso()}
	method bulto() {return 2}
	method nivelPeligrosidad() {return cosaQueEmbala.peso() / 2 }
	method cargar() {}
}


