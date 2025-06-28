page 50102 "Dictionary Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Dictionary Page';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Order No"; OrderNo) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TrackSales)
            {
                Caption = 'Track Sales';
                trigger OnAction()
                begin
                    TrackSalesOrders();
                end;
            }

            group(Dictionary)
            {
                action(AddElement)
                {
                    trigger OnAction()
                    var
                        orderId: Text;
                        productId: Text;
                        MessageText: Text;
                        productOutputList: List of [Text];
                    //orderId: Integer;
                    begin
                        Clear(orderDict);
                        Clear(productList);
                        Clear(productOutputList);
                        // Multiline String declaration
                        MessageText :=
                            @' Order id: %1\
                                Product id: %2, %3
                            ';

                        OrderNo := 'ORD001';
                        productList.Add('PRD001');
                        productList.Add('PRD002');

                        // Calling the Add function
                        orderDict.Add(OrderNo, productList);

                        //productList := orderDict.Keys();   //Return - List of [Text]
                        foreach orderId in orderDict.Keys() do begin
                            //Get return the value based on key in dictionary
                            foreach productId in orderDict.Get(orderId) do begin
                                productOutputList.Add(productId);
                            end;
                            Message(MessageText, orderId, productOutputList.Get(1), productOutputList.Get(2));
                        end;

                    end;
                }

                action(CountElement)
                {
                    trigger OnAction()
                    var
                        dataDict: Dictionary of [Text, Text];
                        MessageText: Text;
                        nameValue1: Text;
                        nameValue2: Text;
                        countryValue: Text;
                        oldValue: Text;
                    begin
                        datadict.Add('name', 'Tarun');
                        datadict.Add('age', '30');
                        datadict.Add('city', 'Hyd');

                        MessageText :=
                            @' Total pair in dictionary : %1\
                               "name" key exists: %2\
                               "country" key exists: %3\
                               Key - "name" and Value - "Tarun" exist: %4\
                               Key - "name" and Value - "Mukul" exist: %5\
                               /* Value "Mukul" does not exist in Dictionary, however, we are getting Yes
                                because Value "Mukul" is overridden by Value "Tarun",
                                
                                Dictionary.Get(Key: TKey, var Value: TValue) */

                               Key -"country" and Value - "India" exist: %6
                            ';
                        nameValue1 := 'Tarun';
                        nameValue2 := 'Mukul';
                        countryValue := 'India';
                        // Count function returns total number of key/value pair in dictionary
                        // ContainsKey function determines whether given key exists in dictionary or not
                        // Get(key, value) don't support value like Get('name','Tarun')
                        Message(MessageText, dataDict.Count(), dataDict.ContainsKey('name'), datadict.ContainsKey('country'),
                                dataDict.Get('name', nameValue1), dataDict.Get('name', nameValue2), dataDict.Get('country', countryValue));

                        dataDict.Set('name', 'Rahul', oldValue);
                        dataDict.Set('age', '32');
                        Message('OldValue of name is: %1', oldValue);

                        dataDict.Remove('city')
                    end;
                }
            }
        }
    }

    var
        OrderNo: Text;
        orderDict: Dictionary of [Text, List of [Text]];
        productList: List of [Text];

    procedure TrackSalesOrders()
    var
        salesOrderItems: Dictionary of [Code[20], List of [Code[20]]];
        itemList: List of [Code[20]];
        salesOrderNo: Code[20];
        itemNo: Code[20];

        salesOrderList: List of [List of [Code[20]]];
        myDictionary: Dictionary of [Text, Integer];
        itemValueList: List of [Code[20]];
        itemValue: Text;
        dictValue: List of [Integer];
        keyValue: Integer;
    begin
        salesOrderNo := 'SO1001';
        itemList.Add('ITEM001');
        itemList.Add('ITEM002');
        salesOrderItems.Add(salesOrderNo, itemList);

        foreach salesOrderNo in salesOrderItems.Keys() do begin
            Message('Sales Order: %1', salesOrderNo);
            foreach itemNo in salesOrderItems.Get(salesOrderNo) do
                Message('Puchased Item %1 indside sales oder %2', itemNo, salesOrderNo);
        end;

        salesOrderList := salesOrderItems.Values;
        foreach itemValueList in salesOrderList do begin
            foreach itemValue in itemValueList do begin
                Message('Item are: %1', itemValue);
            end;
        end;

        myDictionary.Add('Key1', 10);
        myDictionary.Add('Key2', 20);
        myDictionary.Add('Key3', 30);

        dictValue := myDictionary.Values;

        foreach keyValue in dictValue do begin
            Message('%1', KeyValue);
        end;
    end;
}