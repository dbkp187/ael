package com.vn.ael.webapp.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.jfree.util.Log;

import com.vn.ael.constants.AELConst;
import com.vn.ael.constants.TypeOfContainer;
import com.vn.ael.enums.ReportMergeInfo;
import com.vn.ael.persistence.entity.Configuration;
import com.vn.ael.persistence.entity.Docsgeneral;
import com.vn.ael.persistence.entity.Exfeetable;
import com.vn.ael.persistence.entity.Truckingdetail;
import com.vn.ael.webapp.dto.FeeExportItem;
import com.vn.ael.webapp.dto.FeeNameExport;

public class ConvertUtil {
	
	/**
	 * Convert from Configuration List 2 Map
	 * @param confs
	 * @return
	 */
	public static Map<Long,String> fromConfigurationList2Map(List<Configuration> confs,boolean... withDes){
		Map<Long,String> map = new LinkedHashMap<>();
		if (confs != null){
			for (Configuration configuration : confs){
				if (withDes.length>0 && withDes[0]){
					map.put(configuration.getId(), configuration.getValue() + AELConst.SEPARATOR+configuration.getDescription());
				}else{
					map.put(configuration.getId(), configuration.getValue());
				}
					
			}
		}
		return map;
	}
	
	/**
	 * Change bigDecimal to 0 if it's null
	 * @param bigDecimal
	 * @return
	 */
	public static BigDecimal getNotNullValue(BigDecimal bigDecimal){
		if (bigDecimal == null){
			return BigDecimal.ZERO;
		}
		return bigDecimal;
	}
	
	public static BigDecimal getNotNullRound(BigDecimal bigDecimal){
		if (bigDecimal == null){
			return BigDecimal.ZERO;
		}
		return bigDecimal.setScale(0, RoundingMode.HALF_UP);
	}
	
	/**
	 * Change bigDecimal to 0 if it's null
	 * @param bigDecimal
	 * @return
	 */
	public static String getNotNullValue(Integer bigDecimal){
		if (bigDecimal == null){
			return AELConst.EMPTY_STRING;
		}
		return bigDecimal.toString();
	}
	
	/**
	 * Change bigDecimal to 0 if it's null
	 * @param bigDecimal
	 * @return
	 */
	public static String getNotNullValue(String bigDecimal){
		if (bigDecimal == null){
			return AELConst.EMPTY_STRING;
		}
		return bigDecimal;
	}

	/**
	 * From docslist 2 map
	 * @param docs
	 * @return
	 */
	public static Map<Long,String> fromDocsList2MapCus(List<Docsgeneral> docs) {
		Map<Long,String> map = new LinkedHashMap<>();
		if (docs != null && !docs.isEmpty()){
			for (Docsgeneral docsgeneral : docs){
				map.put( docsgeneral.getId(), docsgeneral.getJobNo()+AELConst.SEPARATOR+docsgeneral.getCustomer().getName());
			}
		}
		return map;
	}
	
	/**
	 * From docslist 2 map
	 * @param docs
	 * @return
	 */
	public static Map<Long,String> fromDocsList2MapCusNative(List<Object> docs) {
		Map<Long,String> map = new LinkedHashMap<>();
		if (docs != null && !docs.isEmpty()){
			for (Object object : docs){
				Object[] obj = (Object[]) object;
				map.put(((BigInteger)obj[0]).longValue(), obj[1]+AELConst.SEPARATOR+obj[2]);
			}
		}
		return map;
	}
	
	/**
	 * From docslist 2 map
	 * @param docs
	 * @return
	 */
	public static Map<Long,String> fromDocsList2MapCusNativeNoCus(List<Object> docs) {
		Map<Long,String> map = new LinkedHashMap<>();
		if (docs != null && !docs.isEmpty()){
			for (Object object : docs){
				Object[] obj = (Object[]) object;
				map.put(((BigInteger)obj[0]).longValue(), obj[1]+"");
			}
		}
		return map;
	}

	/**
	 * 
	 * @param docsgenerals
	 * @return
	 */
	public static Map<ReportMergeInfo,List<Integer>> generateMergeIndexForTrans(List<Docsgeneral> docsgenerals){
		Map<ReportMergeInfo,List<Integer>> map = new LinkedHashMap<>();
		List<List<Integer>> orders = generateMergIndexByJobAndCont(docsgenerals);
		map.put(ReportMergeInfo.BANG_KE_CUOC_VAN_CHUYEN, orders.get(0));
		map.put(ReportMergeInfo.BANG_KE_CUOC_VAN_CHUYEN_L2, orders.get(1));
		return map;
	}
	
	public static String convertToVND(BigDecimal value){
		String result = "";
		try {
			result = numberToString(value.doubleValue());
		} catch (Exception e) {
			// TODO: handle exception
			Log.error("FAILED TO CONVERT BIGDECIMAL TO VND");
		}
		return result;
        
	}
	public static String formatNumberForRead(double number) {
        NumberFormat nf = NumberFormat.getInstance();
        String temp = nf.format(number);
        String strReturn = "";
        int slen = temp.length();
        for (int i = 0; i < slen; i++) {
            if (String.valueOf(temp.charAt(i)).equals("."))
                break;
            else if (Character.isDigit(temp.charAt(i))) {
                strReturn += String.valueOf(temp.charAt(i));
            }
        }
        return strReturn;

    }
    public static String numberToString(double number) {
        String sNumber = formatNumberForRead(number);
        // Tao mot bien tra ve
        String sReturn = "";
        // Tim chieu dai cua chuoi
        int iLen = sNumber.length();
        // Lat nguoc chuoi nay lai
        String sNumber1 = "";
        for (int i = iLen - 1; i >= 0; i--) {
            sNumber1 += sNumber.charAt(i);
        }
        // Tao mot vong lap de doc so
        // Tao mot bien nho vi tri cua sNumber
        int iRe = 0;
        do {
            // Tao mot bien cat tam
            String sCut = "";
            if (iLen > 3) {
                sCut = sNumber1.substring((iRe * 3), (iRe * 3) + 3);
                sReturn = Read(sCut, iRe) + sReturn;
                iRe++;
                iLen -= 3;
            } else {
                sCut = sNumber1.substring((iRe * 3), (iRe * 3) + iLen);
                sReturn = Read(sCut, iRe) + sReturn;
                break;
            }
        } while (true);
        if(sReturn.length() > 1){
            sReturn = sReturn.substring(0,1).toUpperCase() + sReturn.substring(1);
        }
        sReturn = sReturn + "đồng";
        return sReturn;
    }

    // Khoi tao ham Read
    public static String Read(String sNumber, int iPo) {
        // Tao mot bien tra ve
        String sReturn = "";
        // Tao mot bien so
        String sPo[] = { "", "ngàn" + " ",
                "triệu" + " ", "tỷ" + " " };
        String sSo[] = { "không" + " ", "một" + " ",
                "hai" + " ", "ba" + " ",
                "bốn" + " ", "năm" + " ",
                "sáu" + " ", "bảy" + " ",
                "tám" + " ", "chín" + " " };
        String sDonvi[] = { "", "mươi" + " ",
                "trăm" + " " };
        // Tim chieu dai cua chuoi
        int iLen = sNumber.length();
        // Tao mot bien nho vi tri doc
        int iRe = 0;
        // Tao mot vong lap de doc so
        for (int i = 0; i < iLen; i++) {
            String sTemp = "" + sNumber.charAt(i);
            int iTemp = Integer.parseInt(sTemp);
            // Tao mot bien ket qua
            String sRead = "";
            // Kiem tra xem so nhan vao co = 0 hay ko
            if (iTemp == 0) {
                switch (iRe) {
                case 0:
                    break;// Khong lam gi ca
                case 1: {
                    if (Integer.parseInt("" + sNumber.charAt(0)) != 0) {
                        sRead = "lẻ" + " ";
                    }
                    break;
                }
                case 2: {
                    if (Integer.parseInt("" + sNumber.charAt(0)) != 0
                            && Integer.parseInt("" + sNumber.charAt(1)) != 0) {
                        sRead = "không trăm" + " ";
                    }
                    break;
                }
                }
            } else if (iTemp == 1) {
                switch (iRe) {
                case 1:
                    sRead = "mười" + " ";
                    break;
                default:
                    sRead = "một" + " " + sDonvi[iRe];
                    break;
                }
            } else if (iTemp == 5) {
                switch (iRe) {
                case 0: {
                    if(sNumber.length() <= 1){
                        sRead = "năm" + " ";
                    }
                    else if (Integer.parseInt("" + sNumber.charAt(1)) != 0) {
                        sRead = "lăm" + " ";
                    } else
                        sRead = "năm" + " ";
                    break;
                }
                default:
                    sRead = sSo[iTemp] + sDonvi[iRe];
                }
            } else {
                sRead = sSo[iTemp] + sDonvi[iRe];
            }

            sReturn = sRead + sReturn;
            iRe++;
        }
        if (sReturn.length() > 0) {
            sReturn += sPo[iPo];
        }

        return sReturn;
    }

    public static String getRomanNumerals(int Int) {
        LinkedHashMap<String, Integer> roman_numerals = new LinkedHashMap<String, Integer>();
        roman_numerals.put("M", 1000);
        roman_numerals.put("CM", 900);
        roman_numerals.put("D", 500);
        roman_numerals.put("CD", 400);
        roman_numerals.put("C", 100);
        roman_numerals.put("XC", 90);
        roman_numerals.put("L", 50);
        roman_numerals.put("XL", 40);
        roman_numerals.put("X", 10);
        roman_numerals.put("IX", 9);
        roman_numerals.put("V", 5);
        roman_numerals.put("IV", 4);
        roman_numerals.put("I", 1);
        String res = "";
        for(Map.Entry<String, Integer> entry : roman_numerals.entrySet()){
          int matches = Int/entry.getValue();
          res += repeat(entry.getKey(), matches);
          Int = Int % entry.getValue();
        }
        return res;
  }
  public static String repeat(String s, int n) {
    if(s == null) {
        return null;
    }
    final StringBuilder sb = new StringBuilder();
    for(int i = 0; i < n; i++) {
        sb.append(s);
    }
    return sb.toString();
  }

  /**
   * Convert for exporting fee
   * @param feesList
   * @return
   */
	public static FeeNameExport fromFeeListToFeeExport(
			List<List<Exfeetable>> feesList) {
		//calculate fee values for each name
		Map<String,List<FeeExportItem>> feeMap = new LinkedHashMap<>();
		if (feesList != null && !feesList.isEmpty()){
			for (int i=0; i<feesList.size(); ++i){
				List<Exfeetable> exfeetables = feesList.get(i);
				if (exfeetables!= null && !exfeetables.isEmpty()){
					for (Exfeetable exfeetable: exfeetables){
						if (exfeetable!= null){
							if (!feeMap.containsKey(exfeetable.getName().getValue())){
								feeMap.put(exfeetable.getName().getValue(), FeeExportItem.createListBySize(feesList.size()));
							}
							//cal fee value
							List<FeeExportItem> crrFeeList = feeMap.get(exfeetable.getName().getValue());
							BigDecimal crrFeeVal = crrFeeList.get(i).getFeeVal();
							crrFeeList.get(i).setFeeVal(ConvertUtil.getNotNullValue(crrFeeVal).add(ConvertUtil.getNotNullValue(exfeetable.getTotal())));
							//cal so HD
							crrFeeList.get(i).setSoHD(crrFeeList.get(i).getSoHD()+exfeetable.getInvoiceNo()+AELConst.NEW_LINE_REPORT);
						}
					}
				}
			}
		}
		return transvertFeeList(feeMap, feesList.size());
	}
	
	public static FeeNameExport fromFeeListToFeeExportFeeType(
			List<List<Exfeetable>> feesList) {
		//calculate fee values for each name
		Map<String,List<FeeExportItem>> feeMap = new LinkedHashMap<>();
		if (feesList != null && !feesList.isEmpty()){
			for (int i=0; i<feesList.size(); ++i){
				List<Exfeetable> exfeetables = feesList.get(i);
				if (exfeetables!= null && !exfeetables.isEmpty()){
					for (Exfeetable exfeetable: exfeetables){
						if (exfeetable!= null){
							if (!feeMap.containsKey(exfeetable.getMasterFee().getValue())){
								feeMap.put(exfeetable.getMasterFee().getValue(), FeeExportItem.createListBySize(feesList.size()));
							}
							//cal fee value
							List<FeeExportItem> crrFeeList = feeMap.get(exfeetable.getMasterFee().getValue());
							BigDecimal crrFeeVal = crrFeeList.get(i).getFeeVal();
							crrFeeList.get(i).setFeeVal(ConvertUtil.getNotNullValue(crrFeeVal).add(ConvertUtil.getNotNullValue(exfeetable.getTotal())));
						}
					}
				}
			}
		}
		
		return transvertFeeList(feeMap,feesList.size());
	}
	
	private static FeeNameExport transvertFeeList(Map<String,List<FeeExportItem>> feeMap, int size){
		FeeNameExport feeNameExport = new FeeNameExport(feeMap.size(),size);
		//convert to vertical
		int i=0;
		for (Entry<String,List<FeeExportItem>> feeM : feeMap.entrySet()){
			feeNameExport.getName().add(feeM.getKey());
			List<FeeExportItem> colFee = feeM.getValue();
			for (int j=0; j<feeNameExport.getValues().size(); ++j){
				List<FeeExportItem> rowFee = feeNameExport.getValues().get(j);
				rowFee.set(i, colFee.get(j));
			}
			++i;
		}
		return feeNameExport;
	}
	
	/**
	 * Create list BidDecimal by size
	 * @param size
	 * @return
	 */
	public static List<BigDecimal> createBySize(int size){
		List<BigDecimal> bigDecimals = new ArrayList<>();
		for (int i=0; i< size; ++i){
			bigDecimals.add(BigDecimal.ZERO);
		}
		return bigDecimals;
	}

	public static Map<ReportMergeInfo, List<Integer>> generateMergeIndexForKHVTNoidia(
			List<Truckingdetail> truckingdetails) {
		Map<ReportMergeInfo,List<Integer>> map = new LinkedHashMap<>();
		List<List<Integer>> lists = generateMergIndexByJobAndContFromDetails(truckingdetails);
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI_NOI_DIA, lists.get(0));
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI_NOI_DIA_L2, lists.get(1));
		return map;
	}
	
	private static List<List<Integer>> generateMergIndexByJobAndCont(List<Docsgeneral> docsgenerals){
		//merge level 1 - by job
				List<Integer> jobsOrder = new ArrayList<>();
				//merge level 2 - by cont
				List<Integer> contOrder = new ArrayList<>();
				if (docsgenerals != null){
					for (Docsgeneral docsgeneral : docsgenerals){
						if (docsgeneral.getTruckingservice() != null && docsgeneral.getTruckingservice().getTruckingdetails() != null){
							jobsOrder.add(docsgeneral.getTruckingservice().getTruckingdetails().size());
							Long contNo=null;
							int countCont = 1;
							if (docsgeneral.getTypeOfContainer().getId() != TypeOfContainer.LCL){
								for (Truckingdetail truckingdetail : docsgeneral.getTruckingservice().getTruckingdetails()){
									if (contNo == null || (truckingdetail.getConsteal() != null && contNo !=truckingdetail.getConsteal().getId())){
										if (contNo != null){
											contOrder.add(countCont);
											countCont = 1;
										}
										if (truckingdetail.getConsteal() != null) {
											contNo = truckingdetail.getConsteal().getId();
										}
									}else{
										++countCont;
									}
								}
							}
							else{
								countCont = docsgeneral.getTruckingservice().getTruckingdetails().size();
							}
							contOrder.add(countCont);
						}else{
							jobsOrder.add(0);
						}
					}
				}
		List<List<Integer>> lists = new ArrayList<>();
		lists.add(jobsOrder);
		lists.add(contOrder);
		return lists;
	}
	
	private static List<List<Integer>> generateMergIndexByJobAndContFromDetails(List<Truckingdetail> truckingdetails){
		List<Integer> jobsOrder = new ArrayList<>();
		//merge level 2 - by cont
		List<Integer> contOrder = new ArrayList<>();
		List<Integer> customers = new ArrayList<>();
		if (truckingdetails !=null && !truckingdetails.isEmpty()){
			Long contNo=null;
			int countCont = 1;
			Long docsNo = null;
			int countDocs = 1;
			Long customer = null;
			int countCustomer = 1;
			for (Truckingdetail truckingdetail : truckingdetails){
				if (truckingdetail.getConsteal() == null){
					contNo=null;
					contOrder.add(countCont);
					countCont = 1;
				}else{
					if (contNo == null || (truckingdetail.getConsteal() != null && contNo !=truckingdetail.getConsteal().getId())){
						if (contNo != null){
							contOrder.add(countCont);
							countCont = 1;
						}
							contNo = truckingdetail.getConsteal().getId();
					}else{
						++countCont;
					}
				}
				
				if (docsNo == null || (docsNo !=truckingdetail.getTruckingservice().getDocsgeneral().getId())){
					if (docsNo != null){
						jobsOrder.add(countDocs);
						countDocs = 1;
					}
					docsNo = truckingdetail.getTruckingservice().getDocsgeneral().getId();
				}else{
					++countDocs;
				}
				
				if (customer == null || (customer !=truckingdetail.getTruckingservice().getDocsgeneral().getCustomer().getId())){
					if (customer != null){
						customers.add(countCustomer);
						countCustomer = 1;
					}
					customer = truckingdetail.getTruckingservice().getDocsgeneral().getCustomer().getId();
				}else{
					++countCustomer;
				}
			}
			contOrder.add(countCont);
			jobsOrder.add(countDocs);
			customers.add(countCustomer);
		}
		List<List<Integer>> lists = new ArrayList<>();
		lists.add(jobsOrder);
		lists.add(contOrder);
		lists.add(customers);
		return lists;
	}

	public static Map<ReportMergeInfo, List<Integer>> generateMergeIndexForKHVT(
			List<Truckingdetail> truckingdetails) {
		Map<ReportMergeInfo,List<Integer>> map = new LinkedHashMap<>();
		List<List<Integer>> lists = generateMergIndexByJobAndContFromDetails(truckingdetails);
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI, lists.get(0));
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI_L2, lists.get(1));
		return map;
	}

	public static Map<ReportMergeInfo, List<Integer>> generateMergeIndexForKHVTThongquan(
			List<Truckingdetail> truckingdetails) {
		Map<ReportMergeInfo,List<Integer>> map = new LinkedHashMap<>();
		List<List<Integer>> lists = generateMergIndexByJobAndContFromDetails(truckingdetails);
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI_THONGQUAN_L2, lists.get(0));
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI_THONGQUAN_L3, lists.get(1));
		map.put(ReportMergeInfo.KE_HOACH_VAN_TAI_THONGQUAN, lists.get(2));
		return map;
	}

	public static Map<ReportMergeInfo, List<Integer>> generateMergeIndexForProfitLoss(
			List<Truckingdetail> truckingdetails) {
		Map<ReportMergeInfo,List<Integer>> map = new LinkedHashMap<>();
		List<List<Integer>> lists = generateMergIndexByJobAndContFromDetails(truckingdetails);
		map.put(ReportMergeInfo.PROFIT_LOSS, lists.get(0));
		map.put(ReportMergeInfo.PROFIT_LOSS_L2, lists.get(1));
		return map;
	}
	
	private static int START_L1_COL = 5;
	private static int OFFSET_TO_L2_COL = 0;
//	private static int TOTAL_L1_COL_LAST = 3;
	public static Map<ReportMergeInfo, List<Integer>> generateDynamicsMergeIndexForProfitLoss(
			Map<String,Object> parameter) {
		Map<ReportMergeInfo,List<Integer>> map = new LinkedHashMap<>();
		List<Integer> feeNames = (List<Integer>)parameter.get("feeNames");
		List<Integer> feeNamesThu = (List<Integer>)parameter.get("feeNamesThu");
		if (feeNames != null && !feeNames.isEmpty()){
			List<Integer> firstLevelMerging = new ArrayList<>();
			for (int i=0; i<feeNames.size();++i){
				firstLevelMerging.add(i+START_L1_COL);
			}
			int nextCol = START_L1_COL+feeNames.size();
			firstLevelMerging.add(nextCol);
			firstLevelMerging.add(nextCol+OFFSET_TO_L2_COL+feeNamesThu.size()+1);
			firstLevelMerging.add(nextCol+OFFSET_TO_L2_COL+feeNamesThu.size()+2);
			firstLevelMerging.add(nextCol+OFFSET_TO_L2_COL+feeNamesThu.size()+3);
			firstLevelMerging.add(nextCol+OFFSET_TO_L2_COL+feeNamesThu.size()+4);
			map.put(ReportMergeInfo.PROFIT_LOSS, firstLevelMerging);
		}
		return map;
	}
	
	public static List<Integer> createListFromArray(int[] cols){
		List<Integer> integers = new ArrayList<>();
		for (int i: cols){
			integers.add(i);
		}
		return integers;
	}
	
	public static List<BigDecimal> createListFromSize(int size){
		List<BigDecimal> integers = new ArrayList<>();
		for (int i=0 ; i<size ; ++i){
			integers.add(BigDecimal.ZERO);
		}
		return integers;
	}

}
