// Employee Database
employee = [
    {
    id: 123,
    fstname:  "Mustafa",
    lstname: "Alvi",
    slry: 120000
}, 
{
    id : 456,
    fstname:  "affan",
    lstname: "khan",
    slry: 200000
}
]

class Employ {
    constructor(ids,firstname,lastname,salary){
        this.ids = ids ;
        this.firstname = firstname ;
        this.lastname = lastname ;
        this.salary = salary ;
}

getid() 
{  employee.forEach(a => {
    if (a.id == this.ids){
    console.log('Employee Id is '+a.id+','+ ' Name is '+ a.fstname+' '+a.lstname+'. Salary is '+a.slry)
} 
    });
}

getsalary() 
{  employee.forEach(a => {
    if (a.id == this.ids){
    console.log('Employee Id with '+a.id+' have annual salary '+a.slry*12+', while increment is '+ Math.floor(a.slry*14/100))
} 
    });
}
}

Emply = new Employ(123,"mustafa","alvi",120000)
// Emply2 = new Employ(456,"affan","khan",200000)

Emply.getid()
Emply.getsalary()
// Emply2.getid()
// Emply2.getsalary()
