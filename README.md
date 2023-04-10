## Finance Blog

# Descrição
Este é um aplicativo Flutter que consome a API do Wordpress para exibir uma lista de postagens em uma tela inicial. Clicando em um dos itens da lista, você é levado para uma tela de detalhes que exibe o conteúdo completo da postagem, incluindo imagens, se houver. O aplicativo utiliza a biblioteca flutter_widget_from_html para renderizar o HTML das postagens.

# Como usar
Antes de executar este aplicativo, certifique-se de que você tenha um blog WordPress em execução no endereço http://localhost/wordpress/ e que esteja funcionando corretamente. Caso contrário, o aplicativo não será capaz de se comunicar com o blog e pode ocorrer erros.

Clone o repositório do aplicativo:
```sh
git clone https://github.com/elleo2001/Flutter_wp.git
```

Acesse o diretório do aplicativo:
```sh
cd Flutter_wp
```

Instale as dependências do Flutter:
```sh
flutter pub get
```

Execute o aplicativo em um emulador ou dispositivo conectado:
```sh
flutter run
```
Isso iniciará o aplicativo e você poderá navegar pela lista de postagens e visualizar os detalhes de cada uma delas. Certifique-se de que o emulador ou dispositivo está conectado à internet para que o aplicativo possa carregar as postagens da API do Wordpress.

Além disso, você pode encontrar um vídeo tutorial sobre como rodar essa aplicação no YouTube, acessando o seguinte link:
https://youtu.be/Edce6NuTZyc