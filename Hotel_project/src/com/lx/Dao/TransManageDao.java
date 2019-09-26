package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.lx.Beans.TransManageBeans;
import com.lx.DbConnection.ConnectionProvider;

public class TransManageDao {
	private Connection conn;

	public TransManageDao() {
		conn = ConnectionProvider.getConeection();
	}

	public void NewArrange(TransManageBeans transmanagebean) {
		try {
			String sql = "INSERT INTO travel (uid,uname,destination,needDate,cost,isApproved)VALUES(?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, transmanagebean.getUid());
			ps.setString(2, transmanagebean.getUname());
			ps.setString(3, transmanagebean.getDestination());
			ps.setString(4, transmanagebean.getNeedDate());
			ps.setDouble(5, transmanagebean.getCost());
			ps.setInt(6, transmanagebean.getIsApproved());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void sendMessage(TransManageBeans transmanagebean) {
		LocalDate today = LocalDate.now();
		try {

			String sql = "INSERT INTO messagetble (uid,tid,datetime,adminMessage,userMessage,status) VALUES (?,?,'"+today+"',?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, transmanagebean.getUid());
			ps.setInt(2, transmanagebean.getTid());
			
			ps.setString(3, transmanagebean.getAdminMessage());
			ps.setString(4, transmanagebean.getUserMessage());
			ps.setString(5, transmanagebean.getStatus());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List getAllTravel() {
		List travel = new ArrayList();

		try {
			String sql = "SELECT * FROM travel";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TransManageBeans tr = new TransManageBeans();

				tr.setTid(rs.getInt("tid"));
				tr.setUid(rs.getInt("uid"));
				tr.setUname(rs.getString("uname"));
				tr.setDestination(rs.getString("destination"));
				tr.setNeedDate(rs.getString("needDate"));
				tr.setCost(rs.getDouble("cost"));
				tr.setIsApproved(rs.getInt("isApproved"));

				travel.add(tr);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return travel;
	}

	// for a user requested
	public List getUserTravelList(int uid) {
		List travel = new ArrayList();

		try {
			String sql = "SELECT * FROM travel WHERE uid=? ORDER BY tid DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TransManageBeans tr = new TransManageBeans();

				tr.setTid(rs.getInt("tid"));
				tr.setDestination(rs.getString("destination"));
				tr.setNeedDate(rs.getString("needDate"));
				tr.setCost(rs.getDouble("cost"));
				tr.setIsApproved(rs.getInt("isApproved"));

				travel.add(tr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return travel;
	}

	public List getAllTravelMessageList(int size,String status) {
		List travelMs = new ArrayList();

		try {
			//String sql = "SELECT * FROM messagetble WHERE adminMessage IS NULL ORDER BY mid ";
			//String sql = "SELECT ms.*,tr.uname FROM messagetble ms,travel tr WHERE tr.uid=ms.uid AND adminMessage IS NULL ORDER BY mid ";
			String sql1 = null;
				
					if(size==0) {	
				
					 sql1="SELECT ms.mid,ms.uid,ms.tid,ms.userMessage,ms.datetime,ms.status,(SELECT us.uname FROM users us WHERE us.uid=ms.uid) AS userName FROM messagetble ms WHERE ms.status=? AND adminMessage IS NULL ORDER BY mid DESC ";
					}else if(size>0){
						 sql1="SELECT ms.mid,ms.uid,ms.tid,ms.userMessage,ms.datetime,ms.status,(SELECT us.uname FROM users us WHERE us.uid=ms.uid) AS userName FROM messagetble ms WHERE ms.status=? AND adminMessage IS NULL ORDER BY mid DESC LIMIT 5 ";
					}
				
				String sql=sql1;
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TransManageBeans tr = new TransManageBeans();

				tr.setMid(rs.getInt("ms.mid"));
				tr.setUserMessage(rs.getString("ms.userMessage"));
				tr.setTid(rs.getInt("ms.tid"));
				tr.setUid(rs.getInt("ms.uid"));
				tr.setStatus(rs.getString("ms.status"));
				tr.setUname(rs.getString("userName"));
				tr.setDatetime(rs.getDate("ms.datetime"));
				travelMs.add(tr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return travelMs;
	}


	public List getUserTravelMessageList(int tid) {
		List travelMs = new ArrayList();

		try {
			String sql = "SELECT * FROM messagetble WHERE tid=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, tid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TransManageBeans tr = new TransManageBeans();

				tr.setMid(rs.getInt("mid"));
				tr.setAdminMessage(rs.getString("adminMessage"));
				tr.setUserMessage(rs.getString("userMessage"));

				travelMs.add(tr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return travelMs;
	}

	/* public List chart(int i) {
		List travel = new ArrayList();

		try {
			String sql = "SELECT tid FROM travel WHERE isApproved=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, i);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TransManageBeans tr = new TransManageBeans();

				tr.setCountTid(rs.getInt("tid"));

				travel.add(tr);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return travel;

	}
	*/
//count from users table
	public Integer totUsers() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(uid) FROM users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs.next();
			String sum = rs.getString(1);
			count = Integer.parseInt(sum);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

	}
//count/sum from travel table
	public Integer totReq() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(tid) FROM travel";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs.next();
			String sum = rs.getString(1);
			count = Integer.parseInt(sum);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

	}
	
	public Integer reportChart(int i) {
		int ans = 0;
		try {
			String sql = "SELECT COUNT(tid) FROM travel WHERE isApproved=? AND MONTH(needDate) = MONTH(CURRENT_DATE()) AND YEAR(needDate) = YEAR(CURRENT_DATE())";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, i);

			ResultSet rs = ps.executeQuery();

			rs.next();
			String x = rs.getString(1);
			System.out.println(x);
			ans = Integer.parseInt(x);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public double costSum() {
		double value = 0.0;
		try {
			String sql = "SELECT SUM(cost) FROM travel";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs.next();
			String sum = rs.getString(1);
			System.out.println(sum);
			value = Double.parseDouble(sum);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return value;

	}

//count from message table
	public Integer reportChartTidCount(String word) {
		int ans=0;
		try {
			String sql="SELECT COUNT(mid) FROM messagetble WHERE status=? AND userMessage IS NOT NULL AND adminMessage IS NULL";
			PreparedStatement ps=conn.prepareStatement(sql);
			//ps.setString(1, "status");
			ps.setString(1, word);
			
			ResultSet rs=ps.executeQuery();
			
			rs.next();
			String x=rs.getString(1);
			System.out.println(x);
			ans=Integer.parseInt(x);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public void confirmReq(TransManageBeans travel) {
		try {
			String sql = "UPDATE travel SET isApproved=? WHERE tid=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, travel.getIsApproved());
			ps.setInt(2, travel.getTid());
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editTravelReq(TransManageBeans travel) {
		try {
			String sql = "UPDATE travel SET destination=?,needDate=?,cost=? WHERE tid=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, travel.getDestination());
			ps.setString(2, travel.getNeedDate());
			ps.setDouble(3, travel.getCost());
			ps.setInt(4, travel.getTid());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteReq(TransManageBeans travel) {
		try {
			String sql = "DELETE FROM travel WHERE tid=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, travel.getTid());

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/*public Calendar timed() {
		Calendar calendar1 = Calendar.getInstance();
		  Calendar calendar2 = Calendar.getInstance();
		 
		  DateFormat dateFormat = new SimpleDateFormat("yyyy,MM,dd");
			Calendar cal = Calendar.getInstance();
			
		  
		  DateFormat df = new SimpleDateFormat("yyyy,MM,dd");
		  Date theDate = null;
		  String formattedDate = df.format(theDate);
		  
		  
		  calendar1.set(2007, 01, 10);
		 // calendar2.set(2007, 07, 01);
		 
		  long milliseconds1 = calendar1.getTimeInMillis();
		  long milliseconds2 = cal.getTimeInMillis();
		  long diff = milliseconds2 - milliseconds1;
		  long diffSeconds = diff / 1000;
		  long diffMinutes = diff / (60 * 1000);
		  long diffHours = diff / (60 * 60 * 1000);
		  long diffDays = diff / (24 * 60 * 60 * 1000);

		  System.out.println("\nThe Date Different Example");
		  System.out.println("Time in milliseconds: " + diff + " milliseconds.");
		  System.out.println("Time in seconds: " + diffSeconds + " seconds.");
		  System.out.println("Time in minutes: " + diffMinutes + " minutes.");
		  System.out.println("Time in hours: " + diffHours + " hours.");
		  System.out.println("Time in days: " + diffDays + " days.");
		return calendar2;
	} */
}
