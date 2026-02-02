using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : genre_code,
                Label : 'Genre',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Published At',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status_code,
                Criticality : status.criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Currency',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Entry Information',
            ID : 'EntryInformation',
            Target : '@UI.FieldGroup#EntryInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters1',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Book Name',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Published At',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : genre_code,
            Label : 'Genre',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.addStock',
            Label : 'Add Stock',
        },
    ],
    UI.SelectionFields : [
        status_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : genre_code,
        },
        TypeImageUrl : 'sap-icon://education',
    },
    UI.FieldGroup #EntryInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
    UI.FieldGroup #Chapters : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.addStock',
            Label : 'Add Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.changePublishDate',
            Label : 'Change Publish Date',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.changeStatus',
            Label : 'Change Status',
        },
    ],
    );

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    status @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.Text : status.displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.Label : 'Status',
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.BookStatus with {
    code @(
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
    ],
    UI.LineItem #Chapters1 : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : pages,
            Label : 'pages',
        },
        {
            $Type : 'UI.DataField',
            Value : number,
            Label : 'number',
        },
    ],
);

annotate service.Books with {
    genre @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Genre',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : genre_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

