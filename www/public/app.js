Ext.application({
    name: 'AM',

    appFolder: 'app',

    controllers: [
        'Users',
    ],
 
    launch: function() {
        Ext.create('Ext.container.Viewport', {

            items: [{
                xtype:'toolbar',
                items:[{
                    text: 'New Items'
                    , handler: function() {
                        var store = Ext.getStore('Users');
                        store.proxy.url = 'get_data.php?query=new';
                        store.load();
                    }
                }
                ,{
                    text: 'Removed Items'
                    , handler: function() {
                        var store = Ext.getStore('Users');
                        store.proxy.url = 'get_data.php?query=removed';
                        store.load();
                    }
                }
                ,{
                    text: 'Changed Items'
                    , handler: function() {
                        var store = Ext.getStore('Users');
                        store.proxy.url = 'get_data.php?query=changed';
                        store.load();
                    }
                }]
            }
            , {
                xtype: 'userlist',
                layout: 'fit'
            }]
        });
    }
});
