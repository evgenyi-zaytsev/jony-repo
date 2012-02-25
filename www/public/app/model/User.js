Ext.define('AM.model.User', {
    extend: 'Ext.data.Model',
    fields: ['name', 
             'AD_KEY',
             'AD_Price',
             'ImagePath',
             'OldPrice',
             'NewPrice',
             'AD_Link'
            ],

    proxy: {
        type: 'ajax',
        url : 'get_data.php?query=new',
        reader: {
            type: 'json'
            , root: 'data'
            //, totalProperty: 'totalCount'
        },
        timeout: 120000
    }
});