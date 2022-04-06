function calculator(param1, param2, type)
{
    if (type == '+'){
        console.log('Add = ' + (param1 + param2));
    }
    else if (type == '-'){
        console.log('Sub = ' + (param1 - param2));
    }
    else if (type == '/'){
        console.log('Div = ' + (param1 / param2));
    }
    else if (type == '*'){
        console.log('Mul = ' + (param1 * param2));
    }
    else if (type == '^'){
        console.log('Sqr = ' + (param1 * param1));
    }
    else if (type == '%'){
        console.log('Per= ' + ((param1 / param2)*100) + ' %');
    }
    else {
        console.log('type not match');
}
}
calculator(4, 14,'+');
calculator(15, 5,'-');
calculator(6, 16,'/');
calculator(7, 17,'*');
calculator(8, 18,'^');
calculator(9, 19,'%');
