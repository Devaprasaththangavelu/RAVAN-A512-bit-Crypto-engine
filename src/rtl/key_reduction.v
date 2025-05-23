// Code your design here
module key_reduction(
  input clk,
  input [511:0]key,
  output reg[15:0]red_key
);
  reg [255:0]red_key1;
  reg [127:0]red_key2;
  reg [63:0]red_key3;
  reg [31:0]red_key4;
  
  always @ (posedge  clk)
    begin
  
  assign red_key1={ key[5]^ key[12], key[79]^ key[33], key[248]^ key[201], key[17]^ key[92],
                    key[401]^ key[300], key[150]^key[4], key[222]^key[98], key[43]^key[7],
                    key[480]^ key[203],key[9]^ key[376], key[81]^ key[29], key[87]^ key[310],
                    key[102]^ key[56], key[240]^ key[330], key[360]^ key[127], key[511]^ key[288],
                    key[39]^ key[193], key[142]^ key[354], key[19]^ key[14], key[74]^ key[64],
                    key[382]^ key[209], key[215]^ key[11], key[273]^ key[96], key[408]^ key[134],
                    key[252]^ key[68], key[110]^ key[163], key[97]^ key[301], key[404]^ key[146],
                    key[177]^ key[122], key[94]^ key[234], key[13]^ key[186], key[22]^ key[36],
                    key[1]^ key[243], key[345]^ key[333], key[0]^ key[65], key[71]^ key[10],
                    key[206]^ key[244], key[311]^ key[106], key[369]^ key[251], key[230]^ key[420],
                    key[298]^key[305], key[55]^ key[80], key[199]^ key[233], key[343]^ key[271],
                    key[158]^ key[223], key[387]^ key[144], key[214]^ key[63], key[194]^ key[166],
                    key[285]^ key[125], key[46]^ key[133], key[297]^ key[37], key[390]^ key[104],
                    key[59]^ key[145], key[18]^ key[72], key[312]^ key[190], key[28]^ key[111],
                    key[254]^ key[140], key[119]^ key[206], key[6]^ key[16], key[20]^ key[23],
                    key[24]^ key[25], key[27]^ key[35], key[41]^ key[44], key[48]^ key[50],
                    key[130]^ key[89], key[211]^ key[304], key[200]^ key[18], key[291]^ key[66],
                    key[88]^ key[139], key[70]^ key[315], key[67]^ key[196], key[142]^ key[319],
                    key[2]^ key[38], key[73]^ key[247], key[182]^ key[154], key[36]^ key[16],
                    key[499]^ key[75], key[83]^ key[124], key[219]^ key[187], key[355]^ key[229],
                    key[51]^ key[250], key[296]^ key[102], key[317]^ key[221], key[53]^ key[192],
                    key[210]^ key[144], key[49]^ key[274], key[233]^ key[103], key[202]^ key[412],
                    key[57]^ key[255], key[107]^ key[116], key[118]^ key[120], key[128]^ key[132],
                    key[135]^ key[137], key[147]^ key[151], key[161]^ key[164], key[167]^ key[172],
                    key[300]^ key[43], key[143]^ key[90], key[307]^ key[119], key[355]^ key[148],
                    key[250]^ key[241], key[132]^ key[27], key[329]^ key[99], key[356]^ key[159],
                    key[258]^ key[76], key[284]^ key[47], key[301]^ key[44], key[5]^ key[6],
                    key[8]^ key[9], key[91]^ key[93], key[95]^ key[96], key[97]^ key[100],
                    key[101]^ key[105], key[108]^ key[112], key[113]^ key[114], key[117]^ key[121],
                    key[123]^ key[126], key[129]^ key[131], key[133]^ key[136], key[138]^ key[141],
                    key[149]^ key[152], key[153]^ key[156], key[160]^ key[162], key[165]^ key[168],
                    key[169]^ key[171], key[173]^ key[175], key[176]^ key[178], key[179]^ key[180],
                    key[511]^ key[400], key[1]^ key[13], key[123]^ key[456], key[220]^ key[109],
                    key[390]^ key[308], key[189]^ key[134], key[205]^ key[266], key[278]^ key[287],
                    key[64]^ key[115], key[14]^ key[3], key[127]^ key[176], key[207]^ key[231],
                    key[237]^ key[299], key[303]^ key[320], key[341]^ key[362], key[371]^ key[388],
                    key[395]^ key[402], key[405]^ key[433], key[448]^ key[460], key[470]^ key[483],
                    key[500]^ key[19], key[21]^ key[26], key[31]^ key[34], key[40]^ key[42],
                    key[45]^ key[52], key[58]^ key[60], key[61]^ key[62], key[69]^ key[77],
                    key[78]^ key[85], key[86]^ key[93], key[101]^ key[104], key[111]^ key[126],
                    key[74]^ key[148], key[296]^ key[370], key[444]^ key[506], key[54]^ key[38],
                    key[22]^ key[6], key[500]^ key[63], key[191]^ key[255], key[319]^ key[383],
                    key[447]^ key[65], key[129]^ key[193], key[257]^ key[321], key[385]^ key[449],
                    key[17]^ key[81], key[145]^ key[209], key[273]^ key[337], key[401]^ key[465],
                    key[2]^ key[18], key[34]^ key[50], key[66]^ key[82], key[98]^ key[114],
                    key[130]^ key[146], key[162]^ key[178], key[194]^ key[210], key[226]^ key[242],
                    key[258]^ key[274], key[290]^ key[306], key[322]^ key[338], key[354]^ key[386],
                    key[402]^ key[418], key[423]^ key[427], key[430]^ key[436], key[440]^ key[443],
                    key[409]^ key[190], key[150]^ key[100], key[0]^ key[139], key[303]^ key[404],
                    key[108]^ key[109], key[110]^ key[111], key[112]^ key[113], key[114]^ key[115],
                    key[116]^ key[117], key[118]^ key[119], key[120]^ key[121], key[122]^ key[123],
                    key[124]^ key[125], key[126]^ key[127], key[128]^ key[129], key[130]^ key[131],
                    key[132]^ key[133], key[134]^ key[135], key[136]^ key[137], key[138]^ key[140],
                    key[141]^ key[142], key[143]^ key[144], key[145]^ key[146], key[147]^ key[148],
                    key[149]^ key[151], key[152]^ key[153], key[154]^ key[155], key[156]^ key[157],
                    key[158]^ key[159], key[160]^ key[161], key[162]^ key[163], key[164]^ key[165],
                    key[360]^ key[361], key[362]^ key[363], key[364]^ key[365], key[366]^ key[367],
                    key[368]^ key[369], key[370]^ key[371], key[372]^ key[373], key[374]^ key[375],
                    key[376]^ key[377], key[378]^ key[379], key[380]^ key[381], key[382]^ key[383],
                    key[384]^ key[385], key[386]^ key[387], key[388]^ key[389], key[390]^ key[391],
                    key[392]^ key[393], key[394]^ key[395], key[396]^ key[397], key[398]^ key[399],
                    key[400]^ key[401], key[402]^ key[403], key[404]^ key[405], key[406]^ key[407],
                    key[408]^ key[410], key[411]^ key[412], key[413]^ key[414], key[415]^ key[416],
                    key[417]^ key[418], key[419]^ key[420], key[421]^ key[422], key[423]^ key[424]};

                 
  assign red_key2={red_key1[82]&red_key1[99], red_key1[1]&red_key1[237], red_key1[231]&red_key1[56], red_key1[24]&red_key1[67],
red_key1[140]&red_key1[224], red_key1[143]&red_key1[121], red_key1[244]&red_key1[241], red_key1[125]&red_key1[214],
red_key1[207]&red_key1[97], red_key1[192]&red_key1[93], red_key1[105]&red_key1[234], red_key1[16]&red_key1[110],
red_key1[10]&red_key1[32], red_key1[225]&red_key1[156], red_key1[47]&red_key1[57], red_key1[23]&red_key1[242],
red_key1[246]&red_key1[209], red_key1[124]&red_key1[72], red_key1[90]&red_key1[221], red_key1[43]&red_key1[223],
red_key1[94]&red_key1[184], red_key1[162]&red_key1[18], red_key1[79]&red_key1[213], red_key1[85]&red_key1[219],
red_key1[131]&red_key1[127], red_key1[33]&red_key1[151], red_key1[116]&red_key1[133], red_key1[222]&red_key1[77],
red_key1[53]&red_key1[129], red_key1[135]&red_key1[11], red_key1[203]&red_key1[253], red_key1[84]&red_key1[111],
red_key1[145]&red_key1[227], red_key1[169]&red_key1[76], red_key1[171]&red_key1[161], red_key1[189]&red_key1[130],
red_key1[139]&red_key1[40], red_key1[46]&red_key1[25], red_key1[196]&red_key1[201], red_key1[198]&red_key1[6],
red_key1[181]&red_key1[157], red_key1[96]&red_key1[74], red_key1[185]&red_key1[34], red_key1[165]&red_key1[86],
red_key1[136]&red_key1[120], red_key1[51]&red_key1[240], red_key1[118]&red_key1[83], red_key1[36]&red_key1[147],
red_key1[104]&red_key1[200], red_key1[164]&red_key1[146], red_key1[89]&red_key1[155], red_key1[128]&red_key1[216],
red_key1[20]&red_key1[194], red_key1[9]&red_key1[172], red_key1[163]&red_key1[55], red_key1[22]&red_key1[191],
red_key1[66]&red_key1[62], red_key1[80]&red_key1[148], red_key1[64]&red_key1[173], red_key1[73]&red_key1[137],
red_key1[115]&red_key1[7], red_key1[210]&red_key1[174], red_key1[2]&red_key1[113], red_key1[87]&red_key1[175],
red_key1[109]&red_key1[119], red_key1[190]&red_key1[35], red_key1[54]&red_key1[235], red_key1[75]&red_key1[229],
red_key1[48]&red_key1[60], red_key1[112]&red_key1[12], red_key1[233]&red_key1[14], red_key1[159]&red_key1[19],
red_key1[29]&red_key1[153], red_key1[199]&red_key1[248], red_key1[179]&red_key1[107], red_key1[215]&red_key1[42],
red_key1[92]&red_key1[44], red_key1[180]&red_key1[188], red_key1[245]&red_key1[21], red_key1[232]&red_key1[170],
red_key1[61]&red_key1[220], red_key1[160]&red_key1[243], red_key1[138]&red_key1[65], red_key1[27]&red_key1[0],
red_key1[193]&red_key1[63], red_key1[183]&red_key1[255], red_key1[26]&red_key1[114], red_key1[206]&red_key1[5],
red_key1[38]&red_key1[144], red_key1[204]&red_key1[95], red_key1[8]&red_key1[178], red_key1[142]&red_key1[126],
red_key1[101]&red_key1[176], red_key1[37]&red_key1[230], red_key1[236]&red_key1[208], red_key1[250]&red_key1[28],
red_key1[149]&red_key1[168], red_key1[187]&red_key1[69], red_key1[123]&red_key1[122], red_key1[152]&red_key1[197],
red_key1[58]&red_key1[211], red_key1[52]&red_key1[134], red_key1[13]&red_key1[88], red_key1[30]&red_key1[195],
red_key1[182]&red_key1[91], red_key1[81]&red_key1[78], red_key1[4]&red_key1[102], red_key1[252]&red_key1[186],
red_key1[3]&red_key1[238], red_key1[254]&red_key1[68], red_key1[166]&red_key1[31], red_key1[15]&red_key1[202],
red_key1[106]&red_key1[108], red_key1[247]&red_key1[154], red_key1[239]&red_key1[103], red_key1[71]&red_key1[226],
red_key1[70]&red_key1[132], red_key1[100]&red_key1[217], red_key1[177]&red_key1[39], red_key1[150]&red_key1[117],
red_key1[158]&red_key1[59], red_key1[17]&red_key1[41], red_key1[50]&red_key1[228], red_key1[205]&red_key1[45],
red_key1[251]&red_key1[249], red_key1[167]&red_key1[218], red_key1[49]&red_key1[212], red_key1[141]&red_key1[98]

};
                    assign red_key3={red_key2[62]|red_key2[42], red_key2[49]|red_key2[17], red_key2[1]|red_key2[43], red_key2[33]|red_key2[20],
red_key2[46]|red_key2[11], red_key2[47]|red_key2[24], red_key2[18]|red_key2[16], red_key2[50]|red_key2[26],
red_key2[10]|red_key2[2],  red_key2[4]|red_key2[25],  red_key2[15]|red_key2[54], red_key2[5]|red_key2[22],
red_key2[38]|red_key2[9],  red_key2[27]|red_key2[6],  red_key2[13]|red_key2[37], red_key2[0]|red_key2[19],
red_key2[39]|red_key2[57], red_key2[48]|red_key2[28], red_key2[61]|red_key2[53], red_key2[41]|red_key2[45],
red_key2[23]|red_key2[56], red_key2[51]|red_key2[21], red_key2[12]|red_key2[7],  red_key2[58]|red_key2[34],
red_key2[30]|red_key2[40], red_key2[52]|red_key2[31], red_key2[36]|red_key2[55], red_key2[29]|red_key2[59],
red_key2[44]|red_key2[32], red_key2[60]|red_key2[35], red_key2[3]|red_key2[63],  red_key2[14]|red_key2[8],red_key2[66] | red_key2[103], red_key2[125] | red_key2[88], red_key2[116] | red_key2[82], red_key2[96] | red_key2[77],
red_key2[120] | red_key2[71], red_key2[115] | red_key2[90], red_key2[73] | red_key2[101], red_key2[112] | red_key2[99],
red_key2[110] | red_key2[67], red_key2[86] | red_key2[100], red_key2[97] | red_key2[127], red_key2[75] | red_key2[91],
red_key2[107] | red_key2[79], red_key2[104] | red_key2[76], red_key2[94] | red_key2[106], red_key2[70] | red_key2[84],
red_key2[105] | red_key2[124], red_key2[122] | red_key2[98], red_key2[126] | red_key2[114], red_key2[93] | red_key2[119],
red_key2[87] | red_key2[118], red_key2[108] | red_key2[92], red_key2[78] | red_key2[69], red_key2[121] | red_key2[102],
red_key2[89] | red_key2[95],  red_key2[117] | red_key2[85], red_key2[113] | red_key2[123], red_key2[83] | red_key2[109],
red_key2[111] | red_key2[81], red_key2[74] | red_key2[80], red_key2[65] | red_key2[98], red_key2[72] | red_key2[68]

};
                    assign red_key4={red_key3[62]&red_key3[42], red_key3[49]&red_key3[17], red_key3[1]&red_key3[43], red_key3[33]&red_key3[20],
    red_key3[46]&red_key3[11], red_key3[47]&red_key3[24], red_key3[18]&red_key3[16], red_key3[50]&red_key3[26],
    red_key3[10]&red_key3[2],  red_key3[4]&red_key3[25],  red_key3[15]&red_key3[54], red_key3[5]&red_key3[22],
    red_key3[38]&red_key3[9],  red_key3[27]&red_key3[6],  red_key3[13]&red_key3[37], red_key3[0]&red_key3[19],
    red_key3[39]&red_key3[57], red_key3[48]&red_key3[28], red_key3[61]&red_key3[53], red_key3[41]&red_key3[45],
    red_key3[23]&red_key3[56], red_key3[51]&red_key3[21], red_key3[12]&red_key3[7],  red_key3[58]&red_key3[34],
    red_key3[30]&red_key3[40], red_key3[52]&red_key3[31], red_key3[36]&red_key3[55], red_key3[29]&red_key3[59],
    red_key3[44]&red_key3[32], red_key3[60]&red_key3[35], red_key3[3]&red_key3[63],  red_key3[14]&red_key3[8]
};

  assign red_key={
    red_key4[31]&red_key4[15],  // bit 15 of red_key4
    red_key4[30]&red_key4[14],  // bit 14
    red_key4[29]&red_key4[13],  // bit 13
    red_key4[28]&red_key4[12],  // bit 12
    red_key4[27]&red_key4[11],  // bit 11
    red_key4[26]&red_key4[10],  // bit 10
    red_key4[25]&red_key4[9],   // bit 9
    red_key4[24]&red_key4[8],   // bit 8
    red_key4[23]&red_key4[7],   // bit 7
    red_key4[22]&red_key4[6],   // bit 6
    red_key4[21]&red_key4[5],   // bit 5
    red_key4[20]&red_key4[4],   // bit 4
    red_key4[19]&red_key4[3],   // bit 3
    red_key4[18]&red_key4[2],   // bit 2
    red_key4[17]&red_key4[1],   // bit 1
    red_key4[16]&red_key4[0]    // bit 0 (LSB)
};
    end
endmodule
                