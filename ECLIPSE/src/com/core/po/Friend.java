package com.core.po;

import java.io.Serializable;

public class Friend implements Serializable{
    private static final long serialVersionUID = 1L;
    
    private Integer owner_id;
    private Integer friend_id;
    private String ownerPicture;
    private String friendPicture;
    private String friendName;
    
    public Integer getOwner_id() {
        return owner_id;
    }
    public void setOwner_id(Integer owner_id) {
        this.owner_id = owner_id;
    }
    public Integer getFriend_id() {
        return friend_id;
    }
    public void setFriend_id(Integer friend_id) {
        this.friend_id = friend_id;
    }
    public String getOwnerPicture() {
        return ownerPicture;
    }
    public void setOwnerPicture(String ownerPicture) {
        this.ownerPicture = ownerPicture;
    }
    public String getFriendPicture() {
        return friendPicture;
    }
    public void setFriendPicture(String friendPicture) {
        this.friendPicture = friendPicture;
    }
    public String getFriendName() {
        return friendName;
    }
    public void setFriendName(String friendName) {
        this.friendName = friendName;
    }
    
}
