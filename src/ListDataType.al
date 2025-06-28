page 50103 "List DataType Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'List Data Type Page';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Order No"; OrderNo)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(List)
            {
                action(AddFunction)
                {
                    trigger OnAction()
                    var
                        strList: List of [Text];
                        strList1: List of [Text];
                        OutputList: List of [Text];
                        name: Text;
                        messageText: Text;
                        messageText1: Text;
                        messageText2: Text;
                        incr: Integer;
                    begin
                        messageText :=
                            @' Add function in List :\
                               Iterate all element from list\
                               Element1 : %1\
                               Element2 : %2\
                               Element3 : %3
                            ';

                        messageText1 :=
                            @' AddRange function in List :\
                               Iterate all element from list\
                               Element1 : %1\
                               Element2 : %2\
                               Element3 : %3
                            ';

                        messageText2 :=
                            @'Total count in List: %1\
                               Index of "Abhi" is: %2\
                               Last Index of "Abhi" is: %3
                            ';
                        strList.Add('Abhay');
                        strList.Add('Naman');
                        strList.Add('Raman');

                        strList1.AddRange(StrList);
                        incr := 0;
                        foreach name in strList do begin
                            incr += 1;
                            OutputList.Insert(incr, name);
                        end;

                        Message(messageText, OutputList.Get(1), OutputList.Get(2), OutputList.Get(3));

                        incr := 0;
                        Clear(OutputList);
                        Clear(name);
                        foreach name in strList1 do begin
                            incr += 1;
                            OutputList.Insert(incr, name);
                        end;
                        Message(messageText1, OutputList.Get(1), OutputList.Get(2), OutputList.Get(3));

                        incr := 0;
                        clear(strList);
                        clear(name);
                        Clear(OutputList);
                        strList.AddRange('Abhi', 'Nikhil', 'Tanmay', 'Abhi');
                        foreach name in strList do begin
                            incr += 1;
                            OutputList.Insert(incr, name);
                        end;
                        Message(messageText1, OutputList.Get(1), OutputList.Get(2), OutputList.Get(3));

                        if strList.Contains('Abhi') then
                            Message(messageText2, strList.Count(), strList.IndexOf('Abhi'), strList.LastIndexOf('Abhi'));
                    end;
                }
                action(GetFunction)
                {
                    trigger OnAction()
                    var
                        nameCollectionList: List of [Text];
                        nameList: List of [Text];
                        name: Text;
                    begin
                        nameCollectionList.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                        Message('Using Get(Integer, var T): %1\ Value of name is: %2', nameCollectionList.Get(2, name), name);
                        Message('Using Get(Integer): %1', nameCollectionList.Get(3));
                        //Using GetRange(Integer,Integer) - Fisrt Interger - start index, Second Integer - Position
                        nameList := nameCollectionList.GetRange(2, 3);
                        Message('//Using GetRange(Integer,Integer):\Element1: %1\Element2: %2\Element3: %3\Element Count: %4',
                         nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Count());

                        Clear(nameList);
                        nameCollectionList.GetRange(2, 3, nameList);
                        Message('//Using GetRange(Integer,Integer,List of [T]):\Element1: %1\Element2: %2\Element3: %3\Element Count: %4',
                         nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Count());
                    end;
                }

                group(Remove)
                {
                    action(RemoveFunction)
                    {
                        trigger OnAction()
                        var
                            nameCollectionList: List of [Text];
                            nameList: List of [Text];
                            name: Text;
                            incr: Integer;
                            messageText: Text;
                        begin
                            incr := 0;
                            messageText :=
                                @'After removing the Element "Reet":
                                 Element1: %1,
                                 Element2: %2,
                                 Element3: %3,
                                 Element4: %4
                                ';
                            nameCollectionList.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                            if nameCollectionList.Remove('Reet') then
                                foreach name in nameCollectionList do begin
                                    incr += 1;
                                    nameList.Insert(incr, name)
                                end;
                            Message(messageText, nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Get(4));
                        end;
                    }
                    action(RemoveAtFunction)
                    {
                        trigger OnAction()
                        var
                            nameCollectionList: List of [Text];
                            nameList: List of [Text];
                            name: Text;
                            incr: Integer;
                            messageText: Text;
                        begin
                            incr := 0;
                            messageText :=
                                @'After removing the Index 3 Element:
                                 Element1: %1,
                                 Element2: %2,
                                 Element3: %3,
                                 Element4: %4
                                ';
                            nameCollectionList.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                            if nameCollectionList.RemoveAt(3) then
                                foreach name in nameCollectionList do begin
                                    incr += 1;
                                    nameList.Insert(incr, name)
                                end;
                            Message(messageText, nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Get(4));
                        end;
                    }

                    action(RemoveRangeFunction)
                    {
                        trigger OnAction()
                        var
                            nameCollectionList: List of [Text];
                            nameList: List of [Text];
                            name: Text;
                            incr: Integer;
                            messageText: Text;
                        begin
                            incr := 0;
                            messageText :=
                                @'After removing the Element from Index 2 to Index 3:\
                                 Element1: %1,\
                                 Element2: %2,\
                                 Element3: %3\
                                ';
                            nameCollectionList.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                            if nameCollectionList.RemoveRange(2, 2) then
                                foreach name in nameCollectionList do begin
                                    incr += 1;
                                    nameList.Insert(incr, name)
                                end;
                            Message(messageText, nameList.Get(1), nameList.Get(2), nameList.Get(3));
                        end;
                    }
                }
                action(ReverseFunction)
                {
                    trigger OnAction()
                    var
                        nameCollectionList: List of [Text];
                        nameList: List of [Text];
                        name: Text;
                        incr: Integer;
                        messageText: Text;
                        messageText1: Text;
                    begin
                        incr := 0;
                        messageText :=
                            @'Before reverse the list:
                                Element1: %1,
                                Element2: %2,
                                Element3: %3,
                                Element4: %4,
                                Element5: %5
                            ';

                        nameCollectionList.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                        foreach name in nameCollectionList do begin
                            incr += 1;
                            nameList.Insert(incr, name)
                        end;
                        Message(messageText, nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Get(4), nameList.Get(5));

                        nameCollectionList.Reverse();
                        messageText1 :=
                            @'After reverse the list:
                                Element1: %1,
                                Element2: %2,
                                Element3: %3,
                                Element4: %4,
                                Element5: %5
                            ';
                        clear(incr);
                        clear(name);
                        clear(nameList);
                        foreach name in nameCollectionList do begin
                            incr += 1;
                            nameList.Insert(incr, name)
                        end;
                        Message(messageText1, nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Get(4), nameList.Get(5));
                    end;
                }
                action(SetFunction)
                {
                    trigger OnAction()
                    var
                        nameCollectionList: List of [Text];
                        nameCollectionList1: List of [Text];
                        nameList: List of [Text];
                        name: Text;
                        incr: Integer;
                        messageText: Text;
                        messageText1: Text;
                        OldValue: Text;
                    begin
                        incr := 0;
                        messageText :=
                            @'After setting the Element at index [3] in list:
                                Element1: %1,
                                Element2: %2,
                                Element3: %3,
                                Element4: %4,
                                Element5: %5
                            ';

                        nameCollectionList.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                        if nameCollectionList.Set(3, 'Nomit') then begin
                            foreach name in nameCollectionList do begin
                                incr += 1;
                                nameList.Insert(incr, name)
                            end;
                            Message(messageText, nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Get(4), nameList.Get(5));
                        end;

                        clear(incr);
                        clear(name);
                        clear(nameList);
                        messageText1 :=
                            @'After setting the Element at index [3] in list:
                                Element1: %1,
                                Element2: %2,
                                Element3: %3,
                                Element4: %4,
                                Element5: %5,

                              Old value at index [3] is: %6
                            ';

                        nameCollectionList1.AddRange('Naman', 'Raman', 'Mayur', 'Reet', 'kamal');
                        if nameCollectionList1.Set(3, 'Nomit', OldValue) then begin
                            foreach name in nameCollectionList1 do begin
                                incr += 1;
                                nameList.Insert(incr, name)
                            end;
                            Message(messageText1, nameList.Get(1), nameList.Get(2), nameList.Get(3), nameList.Get(4), nameList.Get(5), OldValue);
                        end;
                    end;
                }
            }
        }
        area(Navigation)
        {
            action(IncStrFunction)
            {
                Caption = 'Increase Str';

                trigger OnAction()
                var
                    InputStr: Text;
                    messageText: Text;
                begin
                    InputStr := OrderNo;
                    messageText :=
                        @'IncStr Function use case:\
                          InputStr: %1\
                          IncStr increament by default value 1:\
                          OutputStr: %2\
                          IncStr increament by given value:\
                          OutputStr: %3
                        ';
                    Message(messageText, OrderNo, IncStr(InputStr), IncStr(InputStr, 5));
                end;
            }
        }
    }

    var
        OrderNo: Text;
        orderDict: Dictionary of [Text, List of [Text]];
        productList: List of [Text];
}