module ReportingHelper
    def chart_one(daily, weekly, month, six_months, year_count)
    chart_one = Fusioncharts::Chart.new({
        width: "600",
        height: "400",
        type: "column2d",
        renderAt: "chartContainer",
        dataSource: {
        chart: {
            caption: "Year in Review",
            subCaption: "Purchased Games",
            xAxisname: "Time period",
            yAxisName: "Number",
            numberPrefix: "",
            theme: "fint",
            exportEnabled: "1",
            },
            categories: [{
                  category: [
                      { label: "1 day" },
                      { label: "1 week" },
                      { label: "3 months" },
                      { label: "6 months" },
                      { label: "1 yr" }
                  ]
                }],
            dataset: [
                {
                    seriesname: "Previous Year",
                    data: [
                        { value: daily },
                        { value:  weekly },
                        { value:  month },
                        { value: six_months },
                        { value: year_count }
                    ]
                }
          ]
        }
    }
    )
        return chart_one
    end
    
end
