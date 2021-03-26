<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (!isset($_POST['username'])) {
		http_response_code(400);
		die();
	}
	$username = $_POST['username'];

	$db = new PDO('mysql:host=localhost;dbname=foobar', 'testuser', 'testuser');
	$stmt = $db->query("SELECT id FROM users WHERE username = '$username'");
	$row = $stmt->fetch();
	if ($row) {
?>
<html>
<head>
	<title>Good end</title>
</head>
<body>
	<h1>Hello user id <?php echo $row['id']; ?></h1>
</body>
</html>
<?php
	} else {
?>
<html>
<head>
	<title>Bad end</title>
</head>
<body>
	<h1>BAD END</h1>
</body>
</html>
<?php
	}
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {

?>
<html>
<head>
	<title>Example form</title>
</head>
<body>
	<h1>Example form</h1>
	<form action="/" method="post">
		<label for="username">Username:</label> <input type="text" name="username" />
		<button type="submit">Submit</button>
	</form>
</body>
</html>
<?php

} else {
	http_response_code(405);
	die();
}
