class Nave {
  var velocidad
  var direccion
  var combustible

  method acelerar(cuanto) {
    velocidad = (velocidad + cuanto).min(100000)
  }

  method desacelerar(cuanto) {
    velocidad = (velocidad - cuanto).max(0)
  }

  method irHaciaElSol() {direccion = 10}

  method escaparDelSol() {direccion = -10}

  method ponerseParaleloAlSol() {direccion = 0}

  method acercarseUnPocoAlSol() {direccion += 1.min(10)}

  method alejarseUnPocoDelSol() {direccion -= 1.max(-10)}

  method cargarCombustible(cuanto) {
    combustible = combustible + cuanto
  }

  method descargarCombustible(cuanto) {
    combustible = (combustible - cuanto).min(0)
  }

  method prepararViaje() //Unicamente es como decir que este metodo lo tienen que tener todos los hijos 
}

class NaveBaliza inherits Nave {
  var baliza

  method cambiarColorDeBaliza(color) {
    baliza = color
  }

 override method prepararViaje() {//Indica que esta sobreescrito
    baliza = "Verde"
    self.ponerseParaleloAlSol()
  } 
}

class NavePasajero inherits Nave {
  var cantPasajeros
  var cantComida
  var cantBebida

  method cargarBebida(cantidad) {
    cantBebida += cantidad
  }

  method cargarComida(cantidad) {
    cantComida += cantidad
  }

  method descargarBebida(cantidad) {
    cantBebida = (cantBebida - cantidad).min(0)
  }

  method descargarComida(cantidad) {
    cantComida -= (cantComida - cantidad).min(0)
  }

  method cantidadDePasajeros(cantidad) {
    cantPasajeros += cantidad
  }

  override method prepararViaje() {
    self.cargarComida(4*cantPasajeros)
    self.cargarBebida(6*cantPasajeros)
    self.acercarseUnPocoAlSol()
  }
}

class NaveDeCombate inherits Nave {
  var estaInvisible
  var misilesDesplegados

  method ponerseVisible() {
    estaInvisible = false
  }

  method ponerseInvisible() {
    estaInvisible = true
  }

  method estaInvisible() = estaInvisible

  method desplegarMisiles() {
    misilesDesplegados = true
  }

  method replegarMisiles() {
    misilesDesplegados = false
  }

  method misilesDesplegados() = misilesDesplegados 

  override method prepararViaje() {
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    return "Saliendo en misión"
  }
}