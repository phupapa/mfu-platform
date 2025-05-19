import React from "react";
import Logo from "../Appcomponents/Images/MLFL_Logo.png";
const Badge = () => {
  return (
    <div className="w-20 ml-12 sm:ml-24 py-12 flex">
      <img src={Logo} alt="" />
    </div>
  );
};

export default React.memo(Badge);
