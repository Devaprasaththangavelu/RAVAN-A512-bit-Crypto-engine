module DynamicKeySlicer (
    input  wire [511:0] key,
  output wire [63:0] sliced_key1,sliced_key2,sliced_key3,sliced_key4,sliced_key5,sliced_key6,sliced_key7,sliced_key8
);

wire [63:0]sliced_key[0:7];

// Static slicing: 8 key slices of 64 bits each
  assign sliced_key[0] = {
  key[84], key[12], key[79], key[33], key[248], key[201], key[17], key[92],
  key[401], key[300], key[150], key[4], key[222], key[98], key[43], key[7],
  key[480], key[203], key[9], key[376], key[81], key[29], key[87], key[310],
  key[102], key[56], key[240], key[330], key[360], key[127], key[511], key[288],
  key[39], key[193], key[142], key[354], key[19], key[14], key[74], key[64],
  key[382], key[209], key[215], key[11], key[273], key[96], key[408], key[134],
  key[252], key[68], key[110], key[163], key[97], key[301], key[404], key[146],
  key[177], key[122], key[94], key[234], key[13], key[186], key[22], key[36]
};

assign sliced_key[1] = {
  key[30], key[243], key[345], key[333], key[15], key[65], key[71], key[10],
  key[206], key[244], key[311], key[106], key[369], key[251], key[230], key[420],
  key[298], key[305], key[55], key[80], key[199], key[233], key[343], key[271],
  key[158], key[223], key[387], key[144], key[214], key[63], key[194], key[166],
  key[285], key[125], key[46], key[133], key[297], key[37], key[390], key[104],
  key[59], key[145], key[18], key[72], key[312], key[190], key[28], key[111],
  key[254], key[140], key[119], key[206], key[6], key[16], key[20], key[23],
  key[24], key[25], key[27], key[35], key[41], key[44], key[48], key[50]
};

assign sliced_key[2] = {
  key[130], key[89], key[211], key[304], key[200], key[18], key[291], key[66],
  key[88], key[139], key[70], key[315], key[67], key[196], key[142], key[319],
  key[32], key[38], key[73], key[247], key[182], key[154], key[36], key[16],
  key[499], key[75], key[83], key[124], key[219], key[187], key[355], key[229],
  key[51], key[250], key[296], key[102], key[317], key[221], key[53], key[192],
  key[210], key[144], key[49], key[274], key[233], key[103], key[202], key[412],
  key[57], key[255], key[107], key[116], key[118], key[120], key[128], key[132],
  key[135], key[137], key[147], key[151], key[161], key[164], key[167], key[172]
};

assign sliced_key[3] = {
  key[300], key[43], key[143], key[90], key[307], key[119], key[355], key[148],
  key[250], key[241], key[132], key[27], key[329], key[99], key[356], key[159],
  key[258], key[76], key[284], key[47], key[301], key[44], key[5], key[155],
  key[8], key[170], key[91], key[93], key[95], key[96], key[97], key[100],
  key[101], key[105], key[108], key[112], key[113], key[114], key[117], key[121],
  key[123], key[126], key[129], key[131], key[133], key[136], key[138], key[141],
  key[149], key[152], key[153], key[156], key[160], key[162], key[165], key[168],
  key[169], key[171], key[173], key[175], key[176], key[178], key[179], key[180]
};

assign sliced_key[4] = {
  key[438], key[400], key[1], key[174], key[123], key[456], key[220], key[109],
  key[390], key[308], key[189], key[134], key[205], key[266], key[278], key[287],
  key[64], key[115], key[181], key[3], key[127], key[176], key[207], key[231],
  key[237], key[299], key[303], key[320], key[341], key[362], key[371], key[388],
  key[395], key[402], key[405], key[433], key[448], key[460], key[470], key[483],
  key[500], key[19], key[21], key[26], key[31], key[34], key[40], key[42],
  key[45], key[52], key[58], key[60], key[61], key[62], key[69], key[77],
  key[78], key[85], key[86], key[93], key[101], key[104], key[111], key[126]
};

assign sliced_key[5] = {
  key[74], key[148], key[296], key[370], key[444], key[437], key[54], key[216],
  key[197], key[6], key[439], key[225], key[191], key[255], key[319], key[383],
  key[447], key[228], key[129], key[193], key[257], key[321], key[385], key[449],
  key[185], key[236], key[145], key[209], key[273], key[337], key[401], key[465],
  key[2], key[188], key[204], key[224], key[232], key[82], key[246], key[114],
  key[130], key[146], key[162], key[178], key[194], key[210], key[226], key[242],
  key[258], key[274], key[290], key[306], key[322], key[338], key[354], key[386],
  key[434], key[418], key[423], key[427], key[430], key[436], key[440], key[443]
};

assign sliced_key[6] = {
  key[409], key[190], key[332], key[248], key[122], key[139], key[417], key[435],
  key[108], key[109], key[261], key[262], key[263], key[264], key[265], key[267],
  key[268], key[269], key[270], key[272], key[275], key[276], key[277], key[279],
  key[280], key[281], key[282], key[283], key[286], key[289], key[130], key[131],
  key[132], key[133], key[134], key[135], key[136], key[137], key[138], key[140],
  key[141], key[142], key[143], key[144], key[145], key[146], key[147], key[148],
  key[149], key[151], key[152], key[153], key[154], key[155], key[156], key[157],
  key[158], key[159], key[160], key[161], key[162], key[163], key[164], key[165]
};

assign sliced_key[7] = {
  key[360], key[361], key[362], key[363], key[364], key[365], key[366], key[367],
  key[368], key[369], key[370], key[371], key[372], key[373], key[374], key[375],
  key[376], key[377], key[378], key[379], key[380], key[381], key[382], key[383],
  key[384], key[385], key[386], key[387], key[388], key[389], key[390], key[391],
  key[392], key[393], key[394], key[395], key[396], key[397], key[398], key[399],
  key[400], key[401], key[402], key[403], key[404], key[405], key[406], key[407],
  key[408], key[410], key[411], key[412], key[413], key[414], key[415], key[416],
  key[417], key[418], key[419], key[420], key[421], key[422], key[423], key[424]
};

 assign slicedkey = {
        sliced_key[0],
        sliced_key[1],
        sliced_key[2],
        sliced_key[3],
        sliced_key[4],
        sliced_key[5],
        sliced_key[6],
        sliced_key[7]
    };

endmodule
