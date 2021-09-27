package com.travel.domain;

import lombok.Data;

@Data
public class AdAttachVO {
	private String uuid;
	private String uploadpath;
	private String filename;
	private String filetype;
	private int bno;
}
