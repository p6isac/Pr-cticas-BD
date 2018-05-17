<?php

$con=mysqli_connect("localhost","root","","consultas");
if(!$con){
	echo mysqli_connect_error();
	echo mysqli_connect_errno();
	exit();
}else{

$cuenta=$_POST['cuenta'];
$valcuenta="/[0-9]{9}$/";
$valicuenta=preg_match($valcuenta, $cuenta);
if($valicuenta==1){
		$bus="SELECT * from alumnos INNER JOIN planteles ON alumnos.id_plantel=planteles.ID_plantel where no_cta=".$cuenta.";";
		$res=mysqli_query($con,$bus);


		echo "<!DCOTYPE html>
				<html lang='es'>
				<head>
					<meta charset='UTF-8'/>
					<title>TablaMysql</title>
					<link rel='stylesheet' type='text/css' href='estilo.css'/>
					
				</head>";
		echo	"<body>";
		echo		"<table>";

						while($fila=mysqli_fetch_assoc($res))
							{	
		echo					"<tr>";
		echo							"<td>".$fila['no_cta']."</td>";
		echo							"<td>".$fila['ApPat']."</td>";
		echo							"<td>".$fila['ApMat']."</td>";
		echo							"<td>".$fila['Nombre']."</td>";
		echo							"<td>".$fila['nombre']."</td>";

		echo				    "</tr>";		
							}			
		echo		"</table>";
		echo		"</body>";
		echo		"<footer></footer>";
		echo	"</html>";
	}else{
	echo "Número de cuenta no valido";
	}
mysqli_close($con);
}
?>





