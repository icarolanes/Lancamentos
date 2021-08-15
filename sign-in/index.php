<!doctype html>

  <html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Signin Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>


  <!-- Custom styles for this template -->
  <link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

  <main class="form-signin">


    <form action="vlog.php" method="post">
      <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h1 class="h3 mb-3 fw-normal">Lançamentos</h1>
      <?php
      session_start();

      if (isset($_SESSION['loginErro'])) {
        echo $_SESSION['loginErro'];
        session_destroy();
      }


      ?>
      <div class="form-floating">
        <input type="text" class="form-control" name="usuario" id="floatingInput" placeholder="name@example.com" required>
        <label for="floatingInput">Usuario</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" name="senha" id="floatingPassword" placeholder="Password" required>
        <label for="floatingPassword">Senha</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" disabled value="remember-me"> Lembre de mim
        </label>
      </div>
      <button class="w-100 btn btn-lg btn-primary" type="submit">Acessar</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
    </form>
  </main>

</body>
</html>