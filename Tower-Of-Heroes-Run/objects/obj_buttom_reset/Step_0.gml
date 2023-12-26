// No evento Step do obj_button

// Obtém a posição atual da visão (câmera)
var view_x = view_xview[0]; // [0] indica a primeira visão, ajuste conforme necessário
var view_y = view_yview[0]; // [0] indica a primeira visão, ajuste conforme necessário

// Define a posição do obj_button em relação à visão
x = view_x + offset_x;
y = view_y + offset_y;
