function letter = Letter_detection(snap)

    load NewTemplates
    snap = imresize(snap,[42 24]);
    rec=[ ];

    for n=1:36
        a = 1+24*(n-1);
        b = 24*n; 
        cor = corr2(NewTemplates(:,a:b),snap);
        rec = [rec cor];
    end

    ind = find(rec==max(rec));

    % Alphabets listings
    switch ind
        case 1
            letter = 'A';
        case 2
            letter = 'B';
        case 3
            letter = 'C';
        case 4
            letter = 'D';
        case 5
            letter = 'E';
        case 6
            letter = 'F';
        case 7
            letter = 'G';
        case 8
            letter = 'H';
        case 9
            letter = 'I';
        case 10
            letter = 'J';
        case 11
            letter = 'K';
        case 12
            letter = 'L';
        case 13
            letter = 'M';
        case 14
            letter = 'N';
        case 15
            letter = 'O';
        case 16
            letter = 'P';
        case 17
            letter = 'Q';
        case 18
            letter = 'R';
        case 19
            letter = 'S';
        case 20
            letter = 'T';
        case 21
            letter = 'U';
        case 22
            letter = 'V';
        case 23
            letter = 'W';
        case 24
            letter = 'X';
        case 25
            letter = 'Y';
        case 26
            letter = 'Z';
        case 27
            letter = '1';
        case 28
            letter = '2';
        case 29
            letter = '3';
        case 30
            letter = '4';
        case 31
            letter = '5';
        case 32
            letter = '6';
        case 33
            letter = '7';
        case 34
            letter = '8';
        case 35
            letter = '9';
        otherwise
            letter = '0';
    end
end