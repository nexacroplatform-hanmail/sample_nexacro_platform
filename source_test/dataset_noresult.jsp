<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java"%>

<%@ page import="com.tobesoft.xplatform.tx.*" %>
<%@ page import="com.tobesoft.xplatform.data.*" %>
<%@ page import="com.tobesoft.xplatform.data.datatype.*" %>

<%
    String strCharset = "utf-8";

    /*********************************************************
     * request로 들어온 내용을 parsing하여
     * input variable list, input dataset list에 저장한다.
     * (MiPlatform 에서 보내온 데이터를 parsing한다.)
     *********************************************************/
    PlatformRequest platformRequest = new PlatformRequest(request.getInputStream(), PlatformType.CONTENT_TYPE_XML, strCharset);
    platformRequest.receiveData();
    PlatformData inPD = platformRequest.getData();

    VariableList    inVariableList  = inPD.getVariableList();
    DataSetList     inDataSetList   = inPD.getDataSetList();


    /*********************************************************
     * response로 보낼 내용을 생성한다.
     * output variable list, output dataset list에 저장한다.
     * (MiPlatform 이 받을 수 있는 데이터 형태로 가공)
     *********************************************************/
    PlatformResponse platformResponse = new PlatformResponse(response.getOutputStream(), PlatformType.CONTENT_TYPE_XML, strCharset);
    //PlatformResponse platformResponse = new PlatformResponse(response.getOutputStream(), PlatformType.CONTENT_TYPE_BINARY, strCharset);
    PlatformData outPD = platformRequest.getData();
    VariableList    outVariableList  = new VariableList();
    DataSetList     outDataSetList   = new DataSetList();

    try {

        // 전송할 Output Dataset 을 생성한다.
        DataSet outDataSet = new DataSet("output");

        int i,j;
        int nRow;

        // Output Dataset 컬럼 정의
        //outDataSet.addColumn("Column0",        DataTypes.STRING, 255);
        //outDataSet.addColumn("IsLogin",        DataTypes.STRING, 255);
        //outDataSet.addConstantColumn("ConstCol0", DataTypes.STRING, 255, "const_Test");
  
  
        for(i=0; i<20; i++)
        {
        		outDataSet.addColumn("Column"+i, DataTypes.STRING, 255);
        }       

        for(j=0; j<1; j++)
        {
            nRow = outDataSet.newRow();
            outDataSet.set(nRow, "Column0",j +" - test - "+ j);
            outDataSet.set(nRow, "Column1",j +" - test - "+ j);
            outDataSet.set(nRow, "Column2",j +" - test - "+ j);
            outDataSet.set(nRow, "Column3",j +" - test - "+ j);
            outDataSet.set(nRow, "Column4",j +" - test - "+ j);
            outDataSet.set(nRow, "Column5",j +" - test - "+ j);
            outDataSet.set(nRow, "Column6",j +" - test - "+ j);
            outDataSet.set(nRow, "Column7",j +" - test - "+ j);
            outDataSet.set(nRow, "Column8",j +" - test - "+ j);
            outDataSet.set(nRow, "Column9",j +" - test - "+ j);
            outDataSet.set(nRow, "Column10",j +" - test - "+ j);
            outDataSet.set(nRow, "Column11",j +" - test - "+ j);
            outDataSet.set(nRow, "Column12",j +" - test - "+ j);
            outDataSet.set(nRow, "Column13",j +" - test - "+ j);
            outDataSet.set(nRow, "Column14",j +" - test - "+ j);
            outDataSet.set(nRow, "Column15",j +" - test - "+ j);
            outDataSet.set(nRow, "Column16",j +" - test - "+ j);
            outDataSet.set(nRow, "Column17",j +" - test - "+ j);
            outDataSet.set(nRow, "Column18",j +" - test - "+ j);
            outDataSet.set(nRow, "Column19",j +" - test - "+ j);
         } 


        // Output Dataset 을 Output Dataset List 에 담는다.
        outDataSetList.add(outDataSet);

        // Output Vairable 을 세팅한다.
        outVariableList.add("ErrorCode", 0);
        outVariableList.add("ErrorMsg",  "조회 성공");
        outVariableList.add("strOutputData", "※ Output Vairable을 받으려면, 화면의 전역변수로 선언하면 됩니다.");

    } catch(Exception e) {

        // Output Vairable 을 세팅한다.
        outVariableList.add("ErrorCode", -1);
        outVariableList.add("ErrorMsg",  e.toString());

    } finally {

        // 조회 결과(Output Dataset List, Output Variable List)를 전송
        outPD.setDataSetList(outDataSetList);
        outPD.setVariableList(outVariableList);
        
        platformResponse.setData(outPD);
        platformResponse.sendData();
    }
%>

