import numpy as np
import skfuzzy as fuzz
from skfuzzy import control as ctrl

# Definir variables de entrada y salida
rendimiento = ctrl.Antecedent(np.arange(0, 121, 1), 'rendimiento')
pobreza = ctrl.Antecedent(np.arange(0, 6, 1), 'pobreza')
extracurricular = ctrl.Antecedent(np.arange(0, 11, 1), 'extracurricular')
priorizables = ctrl.Antecedent(np.arange(0, 26, 1), 'priorizables')
lengua = ctrl.Antecedent(np.arange(0, 11, 1), 'lengua')

puntuacion_total = ctrl.Consequent(np.arange(0, 171, 1), 'puntuacion_total')

# Definir funciones de membresía triangulares para la variable de salida
puntuacion_total['baja'] = fuzz.trimf(puntuacion_total.universe, [0, 0, 85])
puntuacion_total['moderada'] = fuzz.trimf(puntuacion_total.universe, [0, 85, 170])
puntuacion_total['alta'] = fuzz.trimf(puntuacion_total.universe, [85, 170, 170])
# Definir funciones de membresía triangulares
rendimiento['bajo'] = fuzz.trimf(rendimiento.universe, [0, 0, 40])
rendimiento['moderado'] = fuzz.trimf(rendimiento.universe, [30, 60, 90])
rendimiento['alto'] = fuzz.trimf(rendimiento.universe, [80, 120, 120])

# Definir funciones de membresía para las otras variables
pobreza['no_pobreza'] = fuzz.trimf(pobreza.universe, [0, 0, 2])
pobreza['moderada'] = fuzz.trimf(pobreza.universe, [1, 3, 5])
pobreza['pobreza_extrema'] = fuzz.trimf(pobreza.universe, [4, 5, 5])

extracurricular['baja'] = fuzz.trimf(extracurricular.universe, [0, 0, 3])
extracurricular['moderada'] = fuzz.trimf(extracurricular.universe, [2, 5, 8])
extracurricular['alta'] = fuzz.trimf(extracurricular.universe, [6, 10, 10])

priorizables['bajas'] = fuzz.trimf(priorizables.universe, [0, 0, 8])
priorizables['moderadas'] = fuzz.trimf(priorizables.universe, [5, 12, 18])
priorizables['altas'] = fuzz.trimf(priorizables.universe, [15, 25, 25])

lengua['no_priorizado'] = fuzz.trimf(lengua.universe, [0, 0, 3])
lengua['moderado'] = fuzz.trimf(lengua.universe, [2, 5, 8])
lengua['alto'] = fuzz.trimf(lengua.universe, [6, 10, 10])

puntuacion_total['baja'] = fuzz.trimf(puntuacion_total.universe, [0, 0, 68])
puntuacion_total['moderada'] = fuzz.trimf(puntuacion_total.universe, [50, 85, 120])
puntuacion_total['alta'] = fuzz.trimf(puntuacion_total.universe, [100, 170, 170])


# Definir reglas difusas
rule1 = ctrl.Rule(rendimiento['bajo'] & ~pobreza['pobreza_extrema'] & extracurricular['baja'] & priorizables['bajas'] & ~lengua['alto'], puntuacion_total['baja'])
rule2 = ctrl.Rule(rendimiento['moderado'] & ~pobreza['pobreza_extrema'] & extracurricular['moderada'] & priorizables['bajas'] & lengua['moderado'], puntuacion_total['moderada'])
rule3 = ctrl.Rule(rendimiento['moderado'] & pobreza['moderada'] & extracurricular['moderada'] & priorizables['moderadas'] & lengua['moderado'], puntuacion_total['moderada'])
rule4 = ctrl.Rule(rendimiento['alto'] & ~pobreza['pobreza_extrema'] & extracurricular['alta'] & priorizables['altas'] & lengua['alto'], puntuacion_total['alta'])
rule5 = ctrl.Rule(rendimiento['alto'] & pobreza['pobreza_extrema'] & extracurricular['alta'] & priorizables['altas'] & lengua['alto'], puntuacion_total['alta'])
# Crear sistema de control
sistema_ctrl = ctrl.ControlSystem([rule1, rule2, rule3, rule4, rule5])
sistema = ctrl.ControlSystemSimulation(sistema_ctrl)

# Asignar valores de entrada
sistema.input['rendimiento'] = 60  # Moderado
sistema.input['pobreza'] = 3  # Moderada
sistema.input['extracurricular'] = 5  # Moderada
sistema.input['priorizables'] = 13  # Moderadas
sistema.input['lengua'] = 5  # Moderado
# Calcular el resultado
sistema.compute()

# Imprimir el resultado
print("Puntuación Total:", sistema.output['puntuacion_total'])

# Visualizar las funciones de membresía y la salida
rendimiento.view(sim=sistema)
pobreza.view(sim=sistema)
extracurricular.view(sim=sistema)
priorizables.view(sim=sistema)
lengua.view(sim=sistema)
puntuacion_total.view(sim=sistema)
