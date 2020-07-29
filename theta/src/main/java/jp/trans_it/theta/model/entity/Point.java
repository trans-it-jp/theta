package jp.trans_it.theta.model.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the points database table.
 * 
 */
@Entity
@Table(name="points")
@NamedQuery(name="Point.findAll", query="SELECT p FROM Point p")
public class Point implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="answer_id")
	private Long answerId;

	private Integer point;

	@Column(name="result_id")
	private Long resultId;

	public Point() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAnswerId() {
		return this.answerId;
	}

	public void setAnswerId(Long answerId) {
		this.answerId = answerId;
	}

	public Integer getPoint() {
		return this.point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Long getResultId() {
		return this.resultId;
	}

	public void setResultId(Long resultId) {
		this.resultId = resultId;
	}

}