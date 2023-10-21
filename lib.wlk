// LIBROS

object fahrenheit451 {
	const property autor = "Ray Bradbury"
	var precio
	var valoracion
	var property version
	
	
	method valoracion(){
		if(self.version() == "ilustrada"){
			valoracion = 8000
		}
		else{ //version original
			valoracion = 3500
		}
		return valoracion
	}
	
	method precio(){
		if(self.version() == "ilustrada"){
			precio = 6000
		}
		else{ //version original
			precio = 5000
		}
		return precio
	}
}

object cuidadoConElPerro{
	const property autor = "Liliana Cinetto"
	var precio
	var valoracion
	var property precioBase = 2900
	
	method valoracion(){ 
		self.precio() //si no setteo el precio antes, no funciona
		valoracion = 5000 + precio / 2
		return valoracion
	}
	
	method precio(){
		if (precioBase.even()){
			precio = (precioBase + 500)
		}
		else{
			precio = (precioBase + 600)
		}
		return precio
	}
}

object patronesDeDiseno{
	const property autor = "Enrich Gamma"
	var precio
	var valoracion
	var property likes = 300
	var valorImaginario 
	
	method valorImaginario(){
		valorImaginario = (likes + 8) * 1.5
		return valorImaginario
		}
	
	method valoracion(){
		self.valorImaginario()
		valoracion = 4000 + 2 * valorImaginario
		return valoracion
	}
	
	method precio(){
		self.valorImaginario()
		if (valorImaginario.even()){
			precio = 5000
		}
		else{
			precio = 6000
		}
		return precio
	}
}

// PERSONAS

object cristina {
	method leGusta(unLibro) = 
		unLibro.autor() == "Liliana Cinetto" || unLibro.precio() > 5500 
}

object roberto{
	method leGusta(unLibro) = 
		unLibro.autor() == "Erich Gamma" || unLibro.autor() == "Jorge Bucay" 
}

object patricia{
	var estaDeHumor = true
	
	method estaDeHumor(vof) {
		estaDeHumor = vof
	}
	method estaDeHumor() = estaDeHumor
	method leGusta(unLibro) = 
	self.estaDeHumor() || unLibro.precio() > 4000
}

// OTROS LIBROS

class Libro{
	var property autor
	var valoracion
	var precio
	var property cantidadPaginas
	var property valoracionBase = 3000
	
	method valoracion(){
		if (cantidadPaginas > 150){
			valoracion = valoracionBase + 4000
		}
		else {
			valoracion = valoracionBase + 3000
		}
		return valoracion
	}
	
	method precio(){
		precio = 1000.min(5 * cantidadPaginas)
		return precio
	}
	
	// VER EL TEMA DE LOS REVIEWS
}

class Persona{
	var property dineroDisponible = 1000
	var property limiteValoracion
	
	method leGusta(unLibro) = 
		(unLibro.precio() < dineroDisponible && 
		unLibro.valoracion() > limiteValoracion)
	
	// VER EL TEMA DE LAS COMPRAS	
}

class Compra{
	const fecha = new Date()
	var property cliente
	var property libros = []
	var property cuponDC
	
	method montoParcial() = libros.sum({unLibro => unLibro.precio()})
	method montoTotal(){
		if (cuponDC == "RX7FD3S" || cuponDC == "K20Z3"){
			if (fecha.dayOfWeek() == "friday"){
				return (self.montoParcial() * (1 - 0.1 - 0.2))
			}
			else {
				return (self.montoParcial() * (1 - 0.1))
			}
		}
		else {
			return (self.montoParcial())
		}
	}
	
	method autoresLibros() = libros.filter({unLibro => unLibro.autor()})
	
	method librosCaros() = libros.filter({unLibro => unLibro.precio() > 4000})
		
}
// HACER LAS PRUEBAS Y LOS ERRORES
