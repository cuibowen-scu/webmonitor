function exportTo(type) {

    $('.table').tableExport({
        filename: 'params_history',
        format: type,
        cols: '1,2,3,4,5,6'
    });

}