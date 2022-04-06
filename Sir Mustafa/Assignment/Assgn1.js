// Password Generator

var range = '1234567890'
password = ''
function passwordgen() {
    for (index = 1; index <=5; index++) {
    var genpass = Math.floor(Math.random()*range.length)
    password += genpass
}
    return password;
}
console.log(passwordgen());
