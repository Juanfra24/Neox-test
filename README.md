# Notices App

Este proyecto es un app para poder informarse con las ultimas noticias, en una primera versio esta pensado para poder recopilar noticias de USA, leer su encabezado y descripcion, como tambien el poder marcar algunas como favoritas y poder visualizarlas en otra pagina.Para esto se utiliza la api de https://newsapi.org/


---

## Ejecutar la App

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/Juanfra24/Neox-test.git
   cd notices_app
   
2. Modificar archivo env (Se puede utilziar el ejemplo del env en el repositorio)

3. Correr en modo debug:

   ```bash
    flutter run

4. Selecciona el dispositivo en que correra la app (De preferencia Android)


## Decisiones técnicas

1. **Utilizar Clean architecture como estructura de codigo:** Si bien el costo en tiempo fue mayor, da una mejor claridad de la logica de negocio, las entidades y los llamados de apis
2. **Dejar llaves en archivo .env:** para mantener las llaves seguras se decidio dejarla fuera del repositorio y a cargo de cada uno el tener su propia key.
3. **Utilizar Cubit en vea de bloc para la navegacion:** al ser una logica simple la de la navegacion se decidio utilizar un cubit que lleve el estado o el indice de la navegacion.
4. **Crear un archivo Changelog:** este archivo representa el orden y las features que se fueron añadiendo en el processo de creado.
5. **Crear una rama dev para el desarrollo de funcionalidades en curso:** ya que el desarrollo de la funcionalidad de favoritos quedo incompleta, se decidio dejarla en una rama separada. El desarrollo de la funcionalidad favoritos esta completo pero con bugs que no se pudieron solucionar por temas de tiempo.
