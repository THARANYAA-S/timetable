  import './Login.css';

 const Login = () => {
   
   return (
     <div className='wrapper'>
      <div className="form-box login">
        <form action="">
          <h1>Login</h1>
          <div className="input-box">
            <label>UserName</label>
            <label><input type ="text" placeholder='Username' required/> </label>
           </div>
          <div className="input-box">
            <label>password</label>
            <input type="password" placeholder='password' required />
          </div>
          <div className='remember-forgot'>
            <label><input type="checkbox"/>remember me</label>
    </div>
   <button type="submit">Login</button>
   <div className="register-link">
      <p>Don't have an account? <a href="/register">Register here</a></p>

   </div>
   
        </form>
      </div>
      <div className="form-box details">
        <form action="">
          <h1>Faculty Details</h1>
          <div className="input-box">
            <label>Faculty Name</label>
            <label><input type ="text" placeholder='facultyname' required/> </label>
           </div>
           <div className="input-box">
            <label>Semester</label>
            <label><input type ="text" placeholder='Semester' required/> </label>
           </div>
           <div className="input-box">
            <label>Faculty Depaertment</label>
            <label><input type ="text" placeholder='Faculty Depaertment' required/> </label>
           </div>
           <div className="input-box">
            <label>Faculty Subject</label>
            <label><input type ="text" placeholder='Faculty Subject' required/> </label>
           </div>
           
           
    
   <button type="submit">Submit</button>
   <div className="register-link">

   </div>
    </form>
      </div>
      <div className="form-box class">
        <form action="">
          <h1> classroom Details</h1>
          <div className="input-box">
            <label> Semester</label>
            <label><input type ="text" placeholder=' semester' required/> </label>
           </div>
            
           <div className="input-box">
            <label>Depaertment</label>
            <label><input type ="text" placeholder='Depaertment' required/> </label>
           </div>
           <div class="input-box">
  <label for="classes">Select Classes</label>
  <select id="classes" name="classes" required>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
  </select>
</div>
  <button type="submit">Submit</button>
   <div className="register-link">

   </div>
   </form>
        
      </div>
      <div className="form-box course">
        <form action="">
          <h1>Course Details</h1>
          <div className="input-box">
            <label> Semester</label>
            <label><input type ="text" placeholder=' Semester' required/> </label>
           </div>
           <div className="input-box">
            <label>  Depaertment</label>
            <label><input type ="text" placeholder='  Depaertment' required/> </label>
           </div>
           <div className="input-box">
            <label>Subject</label>
            <label><input type ="text" placeholder='Subject name & code' required/> </label>
           </div>
            <button type="submit">Submit</button>
   <div className="register-link">

   </div>
    </form>
        </div>
        <div className="form-box student">
        <form action="">
          <h1> view Time Table</h1>
          <div className="input-box">
            <label> Semester</label>
            <label><input type ="text" placeholder=' Semester' required/> </label>
           </div>
           <div className="input-box">
            <label>  Depaertment</label>
            <label><input type ="text" placeholder='  Depaertment' required/> </label>
           </div>       
            <button type="submit"> view time table</button>
   <div className="register-link">

   </div>
    </form>
        </div>
     </div>
   );
 };
 
 export default Login
