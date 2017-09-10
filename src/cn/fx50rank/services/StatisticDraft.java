package cn.fx50rank.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

//import javax.persistence.MapKey;
import javax.swing.event.ListDataEvent;

import com.github.abel533.echarts.Legend;
import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.Tooltip;
import com.github.abel533.echarts.axis.AxisLabel;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Magic;
import com.github.abel533.echarts.code.MarkType;
import com.github.abel533.echarts.code.Orient;
import com.github.abel533.echarts.code.Symbol;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.code.X;
import com.github.abel533.echarts.data.LineData;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.data.PointData;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Funnel;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.MarkPoint;
import com.github.abel533.echarts.series.Pie;
import com.github.abel533.echarts.series.force.Category;
import com.github.abel533.echarts.util.EnhancedOption;

public class StatisticDraft {
	
	/**************/
	/*  XaxisListData 时间轴
	 *  YaxisListData 纵轴
	 *  title 图表标题
	 *  legend1  图例标题1
	 *  legend2  图例标题2   
	 */
	/*************/
	public EnhancedOption  drawTwoLines(List<Date> XaxisListData, Map<String,List<Double>> YaxisListData, String title, String legend1
			, String legend2){
        
		EnhancedOption option = new EnhancedOption();
        
		option.title(title, "已平仓订单数:"+Integer.toString(XaxisListData.size())+"个");
        option.tooltip().trigger(Trigger.axis);
        option.legend(legend1, legend2).color("#FF0000","#0000FF");
        option.toolbox().show(true).feature(Tool.mark,
                Tool.dataView,
                new MagicType(Magic.line,  Magic.bar, Magic.stack, Magic.tiled),
                Tool.restore,
                Tool.saveAsImage).padding(20);
        option.calculable(true);
        //heqi-start
        
        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.boundaryGap(true);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for(Date date:XaxisListData){       	
        	categoryAxis.data(dateFormat.format(date));
        }
        option.xAxis(categoryAxis);
        Line line1 = new Line(legend1);
        Line line2 = new Line(legend2);
                
        line1.smooth(false).itemStyle().normal().lineStyle().color("#FF0000");
        line2.smooth(false).itemStyle().normal().lineStyle().color("#0000FF");
        //line2.smooth(true).itemStyle().normal().areaStyle().typeDefault();

        for(Double i:YaxisListData.get("line1")){
        	line1.data(i);        	
        }
        for(Double i:YaxisListData.get("line2")){
        	line2.data(i);
        }
        //heqi-end
        //option.xAxis(new CategoryAxis().boundaryGap(false).data("周一", "周二", "周三", "周四", "周五", "周六", "周日", "周六", "周日"));
        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value}$");
        option.yAxis(valueAxis);

/*        Line l1 = new Line("成交");
        l1.smooth(true).itemStyle().normal().areaStyle().typeDefault();
        l1.data(10, 12, 21, 54, 260, 830, 710,100,100);

        Line l2 = new Line("预购");
        l2.smooth(true).itemStyle().normal().areaStyle().typeDefault();
        l2.data(30, 182, 434, 791, 390, 30, 10,100,100);

        Line l3 = new Line("意向");
        l3.smooth(true).itemStyle().normal().areaStyle().typeDefault();
        l3.data(1320, 1132, 601, 234, 120, 90, 20,100,100);*/

        option.series(line1, line2);		    
	    return option;
	}
	
	public EnhancedOption drawOneLines(List<Date> XaxisListData, Map<String, List<Double>> YaxisListData, String title, String legend, String unit){
		EnhancedOption option = new EnhancedOption();
        
		option.title(title);
        option.tooltip().trigger(Trigger.axis);
        option.legend(legend).color("#FF0000");
        option.toolbox().show(true).feature(Tool.mark,
                Tool.dataView,
                new MagicType(Magic.line,  Magic.bar, Magic.stack, Magic.tiled),
                Tool.restore,
                Tool.saveAsImage).padding(20);
        option.calculable(true);
        //heqi-start
        
        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.boundaryGap(true);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for(Date date:XaxisListData){       	
        	categoryAxis.data(dateFormat.format(date));
        }
        option.xAxis(categoryAxis);
        Line line1 = new Line(legend);
                
        line1.smooth(false).itemStyle().normal().lineStyle().color("#FF0000");

        for(Double i:YaxisListData.get("line1")){
        	line1.data(i);        	
        }

        //heqi-end
        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value}"+unit);
        option.yAxis(valueAxis);

        option.series(line1);		    
	    return option;	
	}
	
	public EnhancedOption drawOneBarString(List<String> XaxisListData,  List<Double> YaxisListData, String title, String legend, String unit){
		EnhancedOption option = new EnhancedOption();
        
		option.title(title);
        option.tooltip().trigger(Trigger.axis);
        option.legend(legend).color("#008000");
        //option.backgroundColor("#ffffff");
        option.toolbox().show(true).feature(Tool.mark,
                Tool.dataView,
                new MagicType(Magic.line,  Magic.bar).show(true),
                Tool.restore,
                Tool.saveAsImage).padding(20);
        option.calculable(true);
        //heqi-start
        
        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.boundaryGap(true);
        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for(String date:XaxisListData){       	
        	//categoryAxis.data(dateFormat.format(date));
        	categoryAxis.data(date);
        }
        option.xAxis(categoryAxis);
        Bar bar = new Bar(legend);
                
       // bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
        bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));
        
        for(Double i:YaxisListData){
        	bar.data(i);        	
        }

        //heqi-end
        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value}"+unit);
        option.yAxis(valueAxis);

        option.series(bar);		    
	    return option;	
	}	
	
	public EnhancedOption drawPie(Map<String, Double> map, String title){
		EnhancedOption option = new EnhancedOption();
		//option.title(title);
		option.title().text(title);
		option.title().subtext("");
		option.title().x(X.center);
		//option.backgroundColor("#ffffff");
		//option.legend().data(legend);
		option.legend().x(X.left);
		option.legend().orient(Orient.vertical);
		
		option.tooltip().trigger(Trigger.item);
		option.tooltip().formatter("{a} <br/>{b} : {c} ({d}%)");
		
		option.toolbox().show(true);
		option.toolbox().feature(Tool.mark,Tool.dataView,Tool.restore,Tool.saveAsImage,new MagicType(Magic.pie,Magic.funnel).
				option(new MagicType.Option().funnel(new Funnel().x("25%").width("50%").funnelAlign(X.left).max(1548))));
		
		option.calculable(true);
		Pie pie1 = new Pie();
		for (Map.Entry<String, Double> entry:map.entrySet()) {
			option.legend().data(entry.getKey());
			pie1.name("账户产品占比").data(new PieData(entry.getKey(), entry.getValue()));
		}
		option.series(pie1);
		return option;
	}
	
	public EnhancedOption drawOneBar(List<Integer> XaxisListData,  List<Double> YaxisListData, String title, String legend, String unit){
		EnhancedOption option = new EnhancedOption();
        
		option.title(title);
        option.tooltip().trigger(Trigger.axis);
        option.legend(legend).color("#008000");
       //option.backgroundColor("#ffffff");
        option.toolbox().show(true).feature(Tool.mark,
                Tool.dataView,
                new MagicType(Magic.line,  Magic.bar).show(true),
                Tool.restore,
                Tool.saveAsImage).padding(20);
        option.calculable(true);
        //heqi-start
        
        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.boundaryGap(true);
        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for(int date:XaxisListData){       	
        	//categoryAxis.data(dateFormat.format(date));
        	categoryAxis.data(date);
        }
        option.xAxis(categoryAxis);
        Bar bar = new Bar(legend);
                
        //bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
        bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));
        
        for(Double i:YaxisListData){
        	bar.data(i);        	
        }

        //heqi-end
        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value}"+unit);
        option.yAxis(valueAxis);

        option.series(bar);		    
	    return option;	
	}	

}
