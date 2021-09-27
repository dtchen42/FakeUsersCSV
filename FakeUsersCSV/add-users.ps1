Import-Module ActiveDirectory

$UsersList = Import-csv -Path "C:\users-fake.csv"

foreach($User in $UsersList)
{
    $Fullname = $User.'Firstname' + " " + $User.'Lastname'
    $Firstname = $User.'Firstname'
    $Lastname = $User.'Lastname'
    $Password = $User.'Password'
    $Username = $User.'Username'
    $OU = $User.'OU'

    #This will create a new user with provided info from CSV file
    New-ADUser -Name $Fullname -DisplayName $Fullname -GivenName $Firstname -Surname $Lastname -Path $OU -Enabled $true -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force)
}