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

  method prepararViaje(){
    self.cargarCombustible(30000)
    self.acelerar(5000)
  } //Unicamente es como decir que este metodo lo tienen que tener todos los hijos

  method estaTranquilo(){
    return combustible >= 40000 and velocidad <= 12000
  }

  method recibirAmenaza() {
    
  }
}

class NaveBaliza inherits Nave {
  var baliza

  method cambiarColorDeBaliza(color) {
    baliza = color
  }

 override method prepararViaje() {//Indica que esta sobreescrito
    baliza = "Verde"
    self.ponerseParaleloAlSol()
    super()
  }

  override method estaTranquilo() {
     return super() and baliza != "Rojo"
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
    super()
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
    super()
  }

  override method estaTranquilo() {
     return super() and not self.misilesDesplegados()
     } 
}

class NaveHospital inherits NavePasajero {
  var quirofanoPreparado

  method prepararQuirofano() {
    quirofanoPreparado = true
  }

  method quirofanoPreparado() = quirofanoPreparado

  override method estaTranquilo() {
     return super() and not self.quirofanoPreparado()
    }
}

class NaveNinja inherits NaveDeCombate {

  override method estaTranquilo() {
     return super() and not self.estaInvisible()
     }
}

