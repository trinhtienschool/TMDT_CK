
// ready
$(document).ready(function() {
    bar_chart($('#revenue'));
    pie_chart($('#order-status'));
});
function bar_chart(canvas){
    console.log("Day la data")
    // console.log(data);
    let data = canvas.data('revenue');
    let labels = canvas.data('labels');
    labels = labels.replace(/'/g, '"') //replacing all ' with "
    labels = JSON.parse(labels);

    console.log(data);
    console.log(labels);
    let data_revenue = {
        labels: labels,
        datasets: [
            {
                label: 'Doanh thu',
                data: data,
                borderColor: 'rgb(127, 173, 57)',
                backgroundColor: 'rgba(127,173,57,0.46)',
                fill : 'start',
                tension: 0.3
            }
        ]
    };
    let config_revenue = {
        type: 'bar',
        data: data_revenue,
        plugins: [ChartDataLabels]
    };

    let revenue_chart = new Chart(
        document.getElementById('revenue'),
        config_revenue
    );
    // revenue_chart.destroy()
}
function pie_chart(canvas){
    let data = canvas.data('revenue');
    let labels = canvas.data('labels');
    labels = labels.replace(/'/g, '"') //replacing all ' with "
    labels = JSON.parse(labels);

    let data_order_status = {
        labels: labels,
        datasets: [{
            label: 'Trạng thái',
            data: data,
            backgroundColor: [
                'rgba(255,37,37,0.86)',
                			'rgb(255,92,0)',
                			'rgb(255,199,0)',
                			'rgb(153,255,0)',
                			'rgb(0,255,225)',
                			'rgb(0,140,255)',
                			'rgb(140,0,255)'

            ],
            hoverOffset: 4
        }]
    };
    let config_order_status = {
        type: 'doughnut',
        data: data_order_status,
        plugins: [ChartDataLabels]
    };

    let order_status_chart = new Chart(
        document.getElementById('order-status'),
        config_order_status
    );
    // order_status_chart.destroy()
}