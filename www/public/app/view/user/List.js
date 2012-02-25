Ext.define('AM.view.user.List' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.userlist',
    //we no longer define the Users store in the `initComponent` method
    store: 'Users',
    title : 'All Users',
    collapsible: true, 

    initComponent: function() {
        this.height = 600;
        this.columns = [
            {
                header: 'Jewels',  
                flex: 1,
                autoScroll: true,
                xtype: "templatecolumn",
                tpl: new Ext.XTemplate(
                        "<div id='content_jew'>",
                        "<img width=150 src='{ImagePath}'/ id='img_short'>",
                        "<h2>Status: {status}</h2>",
                        "<h2>Lot: {name}</h2>",
                        "<p>Price: EUR {NewPrice}</p>",
                        "<p>URL: <a href='{AD_Link}' target='_blank'>see the jewel</a></p>",
                        "<p>Url-key: {AD_KEY}</p>",
                        "<p>Change: EUR {[(values.NewPrice - values.OldPrice).toFixed(2)]} </p>",
                        "</div>",

                {
                })
            },
        ];
        this.callParent(arguments);
    }


});
