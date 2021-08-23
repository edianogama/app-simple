# flutter_app

Flutter project
### Instalação
1. Flutter [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2. Clone o repositório
3. Altere a urlBase em: 
   ```sh
       lib/app/common/constants
    ```

    ```sh
       BASE_URL=<URL>
    ```
4. Vá até a pasta raiz
   ```sh
   flutter pub get 
   ```
5. Abra o simulador 
    ```sh
    open -a Simulator
    ```
6. Execute o aplicativo

### Estrutura de pasta
Estrutura de pasta deste projeto.

```
lib/
|- app/
|- main.dart
```

```
app/
|- common/
   |- storage/
   |- util/
   |- values/
   |- constants.dart
|- data/
   |- authentication/
   |- model/
   |- provider/
   |- repository/
   |- interface_controller/
   |- interface_controller/
   |- api_helper.dart
|- modules/
   |- home/
   |- events/
   |- initial/
   |- login/
   |- widgets/
|- routes/
```