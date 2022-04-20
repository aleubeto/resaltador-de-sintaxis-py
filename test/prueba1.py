def triangle(a,b,c):

    #Comprobamos que son números
    valid_input = a.isnumeric() and b.isnumeric() and c.isnumeric()

    #Si tenemos un input válido
    if valid_input:
        a = int(a)
        b = int(b)
        c = int(c)

        #Comprobamos si forman un triangulo
        is_triangle = (a+b>c) and (b+c>a) and (a+c>b)
        if is_triangle:

            #Identificamos que tipo de triangulo es
            if a == b and b == c and a == c:
                return '>>> Equilatero'
            elif a != b and b != c and a != c:
                return '>>> Escaleno'
            else:
                return '>>> Isósceles'

        else:
            return '>>> Ingrese los lados de un triangulo válido, por favor.'

    #Caso base
    return '>>> Ingrese números enteros positivos, por favor.'

# Ejecución del programa principal
a = input("\na = ")
b = input("b = ")
c = input("c = ")
print(triangle(a,b,c))