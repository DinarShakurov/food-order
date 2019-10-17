<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>

    <!-- Последняя компиляция и сжатый CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Дополнение к теме -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <form class="form-signin">
        <h2 class="form-signin-heading">Регистрация</h2>

        <label for="inputNumber" class="sr-only">Номер</label>
        <input type="number" id="inputNumber" class="form-control" placeholder="+79999999999" required="" autofocus="">

        <label for="inputName" class="sr-only">Имя</label>
        <input type="text" id="inputName" class="form-control" placeholder="Ivan" required="" autofocus="">

        <label for="inputEmail" class="sr-only">Почта</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="user@mail.ru" required="" autofocus="">

        <label for="inputPassword" class="sr-only">Пароль</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="qwerty" required="">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Запомнить меня
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Отправить</button>
    </form>

</div>

<!-- Последняя компиляция и сжатый JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>