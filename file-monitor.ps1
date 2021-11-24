$MailTo1 = "it@example.com" 
$MailTo2 = "user@example.com"
$SmtpServer = "1.1.1.1"
$Testfile = "\\fileserver\data$\a.txt"
$body = Get-Content -Path "C:\PowershellScripts\RansomeWare\prosedyre.txt" | Out-String 
Get-Content $Testfile | %{if ($_ -notmatch 'I AM ALIVE') {
	Send-MailMessage -from "ransomwaremonitor@example.com" -to $MailTo1, $MailTo2 -Subject "Ransomeware - File encrypted" -body $body -SmtpServer $SmtpServer
	} elseif (!Test-path $Testfile) {
		Send-MailMessage -from "ransomwaremonitor@example.com" -to $MailTo1, $MailTo2 -Subject "Ransomware - File removed" -body $body -SmtpServer $SmtpServer
	}
}

