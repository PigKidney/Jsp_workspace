package chap07.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import chap07.dto.BreadDTO;

public class BreadDao {
	
	public List<BreadDTO> getAll(){
		String sql = "SELECT * FROM bread";
		List<BreadDTO> list = new ArrayList<>();
		
		try (
			Connection conn = DBConnector.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		){
			while (rs.next()) {
				list.add(new BreadDTO(
						rs.getString("bread_name"),
						rs.getInt("bread_price")));
				
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Integer insert(BreadDTO breadDto) {
		// 나중에 테이블이 수정되는 것에 대비해 컬럼명을 다 쓰는 것이 바람직하다
		String sql = "INSERT INTO bread(bread_name,bread_price) VALUES (?,?)";

		try (
				Connection conn = DBConnector.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
			){
				pstmt.setString(1, breadDto.getBread_name());
				pstmt.setInt(2, breadDto.getBread_price());
				
				return pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		
	}
	
	public Integer delete(String Bread_name) {
		// 나중에 테이블이 수정되는 것에 대비해 컬럼명을 다 쓰는 것이 바람직하다
		String sql = "DELETE FROM bread WHERE bread_name = ? ";

		try (
				Connection conn = DBConnector.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
			){
				pstmt.setString(1,Bread_name);				
				return pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		
	}
	
	public Integer update(String Bread_name, Integer Bread_price) {
		// 나중에 테이블이 수정되는 것에 대비해 컬럼명을 다 쓰는 것이 바람직하다
		String sql = "UPDATE bread SET bread_price=? WHERE bread_name = ? ";

		try (
				Connection conn = DBConnector.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
			){
			
				pstmt.setInt(1, Bread_price);
				pstmt.setString(2,Bread_name);				
				return pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		
	}
}
