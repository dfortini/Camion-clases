import cosas.*

class Camion {
	const pesoTara = 1000
	const pesoMaximo = 2500
	const property cosas = #{}
		
	method cargar(cosa) { 
		cosas.add(cosa)
		cosa.cargar()
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method todoPesoPar(){
		return cosas.all({ cosa => cosa.peso().even()})
		//return (cosas.sum({ cosa => cosa.peso() }) % 2) == 0
		//return (cosas.sum({ cosa => cosa.peso()) / 2 == 0
		//return cosas.sum({ cosa => cosa.peso() }).even()
	}
	
	method hayAlgunoQuePesa(kg){
		return cosas.any( {cosa => cosa.peso() === kg})
	}
	
	method elDeNivel(nivel){
		return cosas.find({cosa => cosa.nivelPeligrosidad() === nivel})
	}
	
	method pesoTotal(){
		return pesoTara + cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() < pesoMaximo
	}
	
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter{cosa => cosa.nivelPeligrosidad() > nivel}
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter{objeto => objeto.nivelPeligrosidad() > cosa.nivelPeligrosidad()}
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return not(self.excedidoDePeso()) and (self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).size() === 0)
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({c => c.peso().between(min,max)})
	}
	
	method cosaMasPesada(){
		return cosas.max({c => c.peso()})
	}
	
	method pesos(){	
		return cosas.map{c => c.peso()}
	}
	
	method totalBultos(){
		return cosas.sum({c => c.bulto()})
	}
}
