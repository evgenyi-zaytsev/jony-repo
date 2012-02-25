Ext.define('AM.store.Users', {
    extend: 'Ext.data.Store',
    //fields: ['img', 'status','title','price','change'],
    // data: [
    //     {img: 'http://cdn1.lostateminor.com/wp-content/uploads/2009/08/caviar-clusters-ring-60x60.jpg', status: 'new', title: 'Super Ring', price: '312$', change: 'WTF'},
    //     {img: 'http://cdn1.lostateminor.com/wp-content/uploads/2009/08/caviar-clusters-ring-60x60.jpg', status: 'deleted', title: 'Great Ring', price: '230$', change: 'WTF'},
    //     {img: 'http://cdn1.lostateminor.com/wp-content/uploads/2009/08/caviar-clusters-ring-60x60.jpg', status: 'new', title: 'Red Ring', price: '330$', change: 'WTF'},
    //     {img: 'http://cdn1.lostateminor.com/wp-content/uploads/2009/08/caviar-clusters-ring-60x60.jpg', status: 'deleted', title: 'Blue Ring', price: '130$', change: 'WTF'},
    //     {img: 'http://cdn1.lostateminor.com/wp-content/uploads/2009/08/caviar-clusters-ring-60x60.jpg', status: 'new', title: 'Green Ring', price: '300$', change: 'WTF'},
    // ]
	autoLoad: true,
	model: 'AM.model.User'
    //, storeId:'UserStore'
});