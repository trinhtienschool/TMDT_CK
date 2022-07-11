
// ready
$(document).ready(function() {
    bar_chart($('#revenue'));
    pie_chart($('#order-status'));
    bar_stackChart($('#revenue-stack-chart'));
});
function bar_stackChart(canvas){
    if($('#revenue-stack-chart').length==0) return;
    console.log("Day la data")
    // console.log(data);
    let data_vendor = canvas.data('revenue_vendor');
    let data_commission = canvas.data('revenue_commission');
    let labels = canvas.data('labels');
    labels = labels.replace(/'/g, '"') //replacing all ' with "
    labels = JSON.parse(labels);

    console.log(data_vendor);
    console.log(labels);
    let data_revenue = {
        labels: labels,
        datasets: [
            {
                label: 'Doanh thu cửa hàng',
                data: data_vendor,
                borderColor: 'rgb(0,255,255)',
                backgroundColor: 'rgba(147,255,239,0.71)',
                fill : 'start',
                tension: 0.3
            },
            {
                label: 'Doanh thu hoa hồng',
                data: data_commission,
                borderColor: 'rgb(0,50,255)',
                backgroundColor: 'rgba(72,115,255,0.78)',
                fill : 'start',
                tension: 0.3
            }
        ]
    };
    let config_revenue = {
        type: 'bar',
        data: data_revenue,
        plugins: [ChartDataLabels],
        options: {
            // plugins: {
            //     title: {
            //         display: true,
            //         text: 'Chart.js Bar Chart - Stacked'
            //     },
            // },
            responsive: true,
            interaction: {
                intersect: false,
            },
            scales: {
                x: {
                    stacked: true,
                },
                y: {
                    stacked: true
                }
            }
        }
    };

    let revenue_chart = new Chart(

        document.getElementById('revenue-stack-chart'),
        config_revenue
    );
    // revenue_chart.destroy()
}
function bar_chart(canvas){
    if($('#revenue').length==0) return;
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
                borderColor: 'rgb(0,255,255)',
                backgroundColor: 'rgba(147,255,239,0.71)',
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
    if($('#order-status').length==0) return;
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
                'rgba(255,0,0,0.82)',
                'rgb(255,89,0)',
                'rgb(255,199,0)',
                'rgb(153,255,0)',
                'rgb(0,255,72)',
                'rgb(17,255,220)',
                'rgb(11,144,255)',
                'rgba(24,2,255,0.86)',
                'rgb(115,0,255)',
                'rgb(183,0,255)',
                'rgb(255,0,213)',
                'rgb(255,0,115)',
                'rgb(255,0,89)',
                'rgb(255,0,0)',

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